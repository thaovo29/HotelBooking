//
//  RoomListVC.swift
//  HotelBooking
//
//  Created by MacOS on 22/12/2022.
//

import UIKit

class RoomListVC: UIViewController {
    var orderDetail: OrderDetailModel?
    var vm = RoomListVM()
    @IBOutlet weak var headerView: HeaderHotel!
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.register(RoomItemTableViewCell.nib(), forCellReuseIdentifier: RoomItemTableViewCell.identifier)
        setupVM()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        headerView.lblTitle.text = vm.orderDetail?.hotel.name ?? ""
        headerView.callBackLike = { [weak self] isLiked in
            guard let self = self else{return}
            DispatchQueue.main.async {
                self.headerView.isLiked.toggle()
                if self.headerView.isLiked{
                    self.headerView.like.image = UIImage(named: "ic_heart_fill")
                } else{
                    self.headerView.like.image = UIImage(named: "ic_heart")
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
    func setupVM(){
        vm.bindData(orderDetail: orderDetail)
        if let hotel = self.vm.orderDetail?.hotel{
            guard HomeManager.shared.saved.firstIndex(where: { item in
                item.name == hotel.name
            }) != nil
            else {
                self.headerView.like.image = UIImage(named: "ic_heart")
                self.headerView.isLiked = false
                return
            }
            self.headerView.like.image = UIImage(named: "ic_heart_fill")
            self.headerView.isLiked = true
        }
    }
}

extension RoomListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.orderDetail?.hotel.room.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: RoomItemTableViewCell.identifier) as? RoomItemTableViewCell
        else{return UITableViewCell()}
        if let model = vm.getRoomAt(index: indexPath.row) {
            cell.configure(with: model)
        }
        cell.callBackReserve = {[weak self] in
            guard let self = self else {return}
            self.vm.pushToPaymentDetail(vc: self, index: indexPath.row)
        }
        return cell
    }
    
    
}
