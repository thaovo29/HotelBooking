//
//  PaymentMethodTBVCell.swift
//  HotelBooking
//
//  Created by MacOS on 23/12/2022.
//

import UIKit

class PaymentMethodTBVCell: UITableViewCell {

    @IBOutlet weak var tfExpireDate: UITextField!
    @IBOutlet weak var tfCVV: UITextField!
    @IBOutlet weak var tfCardNumber: UITextField!
    @IBOutlet weak var tfCardOwner: UITextField!
    @IBOutlet weak var viewCardInformation: UIView!
    @IBOutlet weak var btnVisa: UIButton!
    @IBOutlet weak var btnCash: UIButton!
    @IBOutlet weak var viewPaymentMethod: UIView!
    var chooseCash:Bool = true
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    static let identifier = "PaymentMethodTBVCell"
    static func nib()->UINib
    {
        return UINib(nibName: "PaymentMethodTBVCell", bundle: nil)
    }
    
    func makeShadow(view: UITextField){
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 4
    }
    
    func setUIBtn(){
        if chooseCash{
            btnCash.backgroundColor = UIColor(red: 37.0/255.0, green: 75.0/255.0, blue: 160.0/255.0, alpha: 1)
            btnVisa.backgroundColor = .gray
        } else{
            btnVisa.backgroundColor = UIColor(red: 37.0/255.0, green: 75.0/255.0, blue: 160.0/255.0, alpha: 1)
            btnCash.backgroundColor = .gray
        }
    }
    
    @IBAction func payByCash(_ sender: Any) {
        chooseCash = true
        setUIBtn()
        viewCardInformation.isHidden = true
    }
    
    @IBAction func payByVisa(_ sender: Any) {
        chooseCash = false
        setUIBtn()
        viewCardInformation.isHidden = false
    }
    
    func setupUI(){
        HomeManager.shared.makeShadow(view: viewPaymentMethod)
        HomeManager.shared.makeShadow(view: viewCardInformation)
        makeShadow(view: tfCVV)
        makeShadow(view: tfCardOwner)
        makeShadow(view: tfCardNumber)
        makeShadow(view: tfExpireDate)
        
        viewPaymentMethod.layer.cornerRadius = 8
        viewCardInformation.layer.cornerRadius = 8
        tfCVV.layer.cornerRadius = 8
        tfCardOwner.layer.cornerRadius = 8
        tfCardNumber.layer.cornerRadius = 8
        tfExpireDate.layer.cornerRadius = 8
        btnCash.layer.cornerRadius = 8
        btnVisa.layer.cornerRadius = 8
        chooseCash = true
        setUIBtn()
        viewCardInformation.isHidden = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
