//
//  BookingDetailVC.swift
//  HotelBooking
//
//  Created by MacOS on 23/12/2022.
//

import UIKit

class BookingDetailVC: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var viewbgnav: UIView!
    @IBOutlet weak var viewNav: NavBottomBar!
    @IBOutlet weak var viewHeader: HeaderTitle!
    var orderDetail: OrderDetailModel?
    var vm = BookingDetailVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupVM()
    }
    func setupUI(){
        viewHeader.lblTitle.text = "Booking Detail"
        viewNav.layer.cornerRadius = 16
        viewbgnav.layer.cornerRadius = 16
        viewNav.backgroundColor = UIColor(red: 37/255.0, green: 75/255.0, blue: 160/255.0, alpha: 1)
        viewbgnav.backgroundColor = UIColor(red: 37/255.0, green: 75/255.0, blue: 160/255.0, alpha: 1)
        
        table.delegate = self
        table.dataSource = self
        table.register(HotelInfomationTBVCell.nib(), forCellReuseIdentifier: HotelInfomationTBVCell.identifier)
        table.register(CustomerInfomationBookingTBVCell.nib(), forCellReuseIdentifier: CustomerInfomationBookingTBVCell.identifier)
        table.register(LocationTableViewCell.nib(), forCellReuseIdentifier: LocationTableViewCell.identifier)
    }
    
    func setupVM(){
        vm.bindData(data: orderDetail)
    }
}

extension BookingDetailVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            guard let cell = table.dequeueReusableCell(withIdentifier: HotelInfomationTBVCell.identifier) as? HotelInfomationTBVCell
            else {return UITableViewCell()}
            if let detail = vm.orderDetail {
                cell.configure(orderDetail: detail)
            }
            return cell
        } else if indexPath.row == 1{
            guard let cell = table.dequeueReusableCell(withIdentifier: CustomerInfomationBookingTBVCell.identifier) as? CustomerInfomationBookingTBVCell
            else{return UITableViewCell()}
            if let detail = vm.orderDetail{
                cell.configure(order: detail)
            }
            
            return cell
        }
        guard let cell = table.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier) as? LocationTableViewCell
        else{return UITableViewCell()}
        if let hotel = vm.orderDetail?.hotel {
            cell.setupUI(lat: hotel.latitude, long: hotel.longitude, hotelName: hotel.name)
        }
        return cell
    }
}
