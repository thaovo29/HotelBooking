//
//  BookingVC.swift
//  HotelBooking
//
//  Created by MacOS on 23/12/2022.
//

import UIKit

class BookingVC: UIViewController {

    @IBOutlet weak var viewbgNav: UIView!
    @IBOutlet weak var viewNav: NavBottomBar!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var viewHeader: HeaderTitle!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        
        viewHeader.lblTitle.text = "Booking"
        viewNav.layer.cornerRadius = 16
        viewbgNav.layer.cornerRadius = 16
        viewNav.backgroundColor = UIColor(red: 37/255.0, green: 75/255.0, blue: 160/255.0, alpha: 1)
        viewbgNav.backgroundColor = UIColor(red: 37/255.0, green: 75/255.0, blue: 160/255.0, alpha: 1)
        
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "HotelItemTBVCell", bundle: nil), forCellReuseIdentifier: "HotelItemTBVCell")
    }
}

extension BookingVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeManager.shared.booking.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: "HotelItemTBVCell") as? HotelItemTBVCell
        else {return UITableViewCell()}
        cell.configure(with: HomeManager.shared.booking[indexPath.row].hotel, isShownPrice: false)
        cell.callBackSeeDetail = { [weak self] in
            guard let self = self else {return}
            HomeManager.shared.pushToBookingDetail(vc: self, order: HomeManager.shared.booking[indexPath.row])
            
        }
        
        return cell
    }
}
