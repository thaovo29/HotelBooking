//
//  HotelDetailVC.swift
//  HotelBooking
//
//  Created by MacOS on 21/12/2022.
//

import UIKit
import GoogleMaps

class HotelDetailVC: UIViewController {

    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnCheckAvailabel: UIButton!
    @IBOutlet weak var viewHeader: HeaderHotel!
    var orderDetail: OrderDetailModel?
    var vm = HotelDetailVM()
    override func viewDidLoad() {
        super.viewDidLoad()
//        GMSServices.provideAPIKey("AIzaSyDc4IppKvEQkl8IM5NwTCvLt39UsVReJkY")
        setupVM()
        // Do any additional setup after loading the view.
        setupUI()
        table.dataSource = self
        table.delegate = self
        table.register(HotelIntroduceTableViewCell.nib(), forCellReuseIdentifier: HotelIntroduceTableViewCell.identifier)
        table.register(HotelDetailAboutTBVCell.nib(), forCellReuseIdentifier: HotelDetailAboutTBVCell.identifier)
        table.register(HotelDetailFacilityTBVCell.nib(), forCellReuseIdentifier: HotelDetailFacilityTBVCell.identifier)
        table.register(LocationTableViewCell.nib(), forCellReuseIdentifier: LocationTableViewCell.identifier)
    }
    
    @IBAction func openRooms(_ sender: Any) {
        vm.pushToRoomList(vc: self)
    }
    func setupVM(){
        vm.bindData(orderDetail: orderDetail)
        if let hotel = self.vm.orderDetail?.hotel{
            guard HomeManager.shared.saved.firstIndex(where: { item in
                item.name == hotel.name
            }) != nil
            else {
                self.viewHeader.like.image = UIImage(named: "ic_heart")
                self.viewHeader.isLiked = false
                return
            }
            self.viewHeader.like.image = UIImage(named: "ic_heart_fill")
            self.viewHeader.isLiked = true
        }
    }
    
    func setupUI(){
        viewHeader.lblTitle.text = vm.getHotelName()
        HomeManager.shared.makeShadow(view: viewHeader)
        btnCheckAvailabel.layer.cornerRadius = 8
        lblPrice.text = "$\(vm.getPrice())/night"
        
        
        
        viewHeader.callBackLike = { [weak self] isLiked in
            guard let self = self else{return}
            DispatchQueue.main.async {
                self.viewHeader.isLiked.toggle()
                if self.viewHeader.isLiked{
                    self.viewHeader.like.image = UIImage(named: "ic_heart_fill")
                } else{
                    self.viewHeader.like.image = UIImage(named: "ic_heart")
                }
            }
            if isLiked {
                if let hotel = self.vm.orderDetail?.hotel{
                    if let index = HomeManager.shared.saved.firstIndex(where: { item in
                        item.name == hotel.name
                    }) {
                        HomeManager.shared.saved.remove(at: index)
                    }
                }
            } else{
                if let hotel = self.vm.orderDetail?.hotel{
                    guard let index = HomeManager.shared.saved.firstIndex(where: { item in
                        item.name == hotel.name
                    })
                    else {
                        HomeManager.shared.saved.append(hotel)
                        return
                    }
                    HomeManager.shared.saved.remove(at: index)
                }
            }
        }
    }
}

extension HotelDetailVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = table.dequeueReusableCell(withIdentifier: HotelIntroduceTableViewCell.identifier) as? HotelIntroduceTableViewCell
            else {
                return UITableViewCell()
            }
            if let model = vm.orderDetail?.hotel {
                cell.configure(with: model)
            }
            return cell
        } else if indexPath.row == 1{
            guard let cell = table.dequeueReusableCell(withIdentifier: HotelDetailAboutTBVCell.identifier) as? HotelDetailAboutTBVCell
            else {
                return UITableViewCell()
            }
            if let model = vm.orderDetail?.hotel {
                cell.configure(with: model)
            }
            return cell
        } else if indexPath.row == 2{
            guard let cell = table.dequeueReusableCell(withIdentifier: HotelDetailFacilityTBVCell.identifier) as? HotelDetailFacilityTBVCell
            else {
                return UITableViewCell()
            }
            if let model = vm.orderDetail?.hotel.facilities {
                cell.configure(with: model)
            }
            return cell
        }
        else{
            guard let cell = table.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier) as? LocationTableViewCell
            else{return UITableViewCell()}
            if let hotel = vm.orderDetail?.hotel {
                cell.setupUI(lat: hotel.latitude, long: hotel.longitude, hotelName: hotel.name)
            }
            return cell
        }
    }
    
}

