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
    }
    func setupVM(){
        vm.bindData(orderDetail: orderDetail)
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
