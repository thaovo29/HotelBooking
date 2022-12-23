//
//  PaymentDetailVC.swift
//  HotelBooking
//
//  Created by MacOS on 22/12/2022.
//

import UIKit

class PaymentDetailVC: UIViewController {

    @IBOutlet weak var btnPay: UIButton!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var lbltotal: UILabel!
    @IBOutlet weak var back: UIImageView!
    var orderDetail: OrderDetailModel?
    var vm = PaymentDetailVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
        setupVM()
        table.register(HotelInfomationTBVCell.nib(), forCellReuseIdentifier: HotelInfomationTBVCell.identifier)
        table.register(CustomerInformationTBVCell.nib(), forCellReuseIdentifier: CustomerInformationTBVCell.identifier)
        table.register(PaymentMethodTBVCell.nib(), forCellReuseIdentifier: PaymentMethodTBVCell.identifier)
        setupUI()
    }
    
    func setupVM(){
        vm.bindData(orderDetail: orderDetail)
    }
    
    func setupUI(){
        btnPay.layer.cornerRadius = 8
        if let order = vm.orderDetail{
            self.lbltotal.text = "Total: $\(order.room.price * order.roomNo)"
        }
        back.isUserInteractionEnabled = true
        let goBack = UITapGestureRecognizer(target: self, action: #selector(goBack))
        back.addGestureRecognizer(goBack)
    }
    @objc func goBack(){
        self.navigationController?.popViewController(animated: true)
    }
}

extension PaymentDetailVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            guard let cell = table.dequeueReusableCell(withIdentifier: HotelInfomationTBVCell.identifier) as? HotelInfomationTBVCell
            else{return UITableViewCell()}
            if let order = vm.orderDetail {
                cell.configure(orderDetail: order)
            }
            return cell
        } else if indexPath.row == 1{
            guard let cell = table.dequeueReusableCell(withIdentifier: CustomerInformationTBVCell.identifier) as? CustomerInformationTBVCell
            else {return UITableViewCell()}
            return cell
        }
        else{
            guard let cell = table.dequeueReusableCell(withIdentifier: PaymentMethodTBVCell.identifier) as? PaymentMethodTBVCell
            else{ return UITableViewCell()}
            return cell
        }
    }
    
    
}
