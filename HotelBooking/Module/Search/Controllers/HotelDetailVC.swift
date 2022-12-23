//
//  HotelDetailVC.swift
//  HotelBooking
//
//  Created by MacOS on 21/12/2022.
//

import UIKit

class HotelDetailVC: UIViewController {

    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnCheckAvailabel: UIButton!
    @IBOutlet weak var viewHeader: HeaderHotel!
    var orderDetail: OrderDetailModel?
    var vm = HotelDetailVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVM()
        // Do any additional setup after loading the view.
        setupUI()
        table.dataSource = self
        table.delegate = self
        table.register(HotelIntroduceTableViewCell.nib(), forCellReuseIdentifier: HotelIntroduceTableViewCell.identifier)
        table.register(HotelDetailAboutTBVCell.nib(), forCellReuseIdentifier: HotelDetailAboutTBVCell.identifier)
        table.register(HotelDetailFacilityTBVCell.nib(), forCellReuseIdentifier: HotelDetailFacilityTBVCell.identifier)

    }
    
    @IBAction func openRooms(_ sender: Any) {
        vm.pushToRoomList(vc: self)
    }
    func setupVM(){
        vm.bindData(orderDetail: orderDetail)
    }
    
    func setupUI(){
        viewHeader.lblTitle.text = vm.getHotelName()
        HomeManager.shared.makeShadow(view: viewHeader)
        btnCheckAvailabel.layer.cornerRadius = 8
        lblPrice.text = "$\(vm.getPrice())/night"
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
            return UITableViewCell()
        }
    }
    
    
}
