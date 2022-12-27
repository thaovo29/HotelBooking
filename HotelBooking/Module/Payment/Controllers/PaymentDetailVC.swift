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
    
    @IBAction func actionPay(_ sender: Any) {
        if self.vm.checkInformation() {
            let alert = UIAlertController(title: "\(HomeManager.shared.getTypeSearch()) Booking", message: "You have already booked \(HomeManager.shared.getTypeSearch()) at \(vm.orderDetail?.hotel.name ?? "")", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    guard let order = self.vm.orderDetail else {return}
                    HomeManager.shared.booking.append(order)
                    self.navigationController?.popToRootViewController(animated: true)
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                }
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Alert", message: "You have to fill out all the field", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
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
            cell.callbackAddName = {[weak self] cusname in
                self?.vm.orderDetail?.customerName = cusname
            }
            cell.callbackAddEmail = { [weak self] email in
                self?.vm.orderDetail?.customerEmail = email
            }
            cell.callbackAddPhoneNumber = { [weak self] phoneNum in
                self?.vm.orderDetail?.customerPhone = phoneNum
            }
            return cell
        }
        else{
            guard let cell = table.dequeueReusableCell(withIdentifier: PaymentMethodTBVCell.identifier) as? PaymentMethodTBVCell
            else{ return UITableViewCell()}
            cell.callbackAddCardnumber = { [weak self] cardNum in
                self?.vm.orderDetail?.cardNumber = cardNum
            }
            cell.callbackAddCardname = { [weak self] cardName in
                self?.vm.orderDetail?.cardOwner = cardName
            }
            cell.callbackAddCardCVV = { [weak self] cvv in
                self?.vm.orderDetail?.cardExpireDate = cvv
            }
            cell.callbackAddCardExpireDate = { [weak self] expireDate in
                self?.vm.orderDetail?.cardExpireDate = expireDate
            }
            cell.callBackPayBy = {[weak self] payby in
                self?.vm.orderDetail?.paymentMethod = payby
            }
            return cell
        }
    }
    
    
}
