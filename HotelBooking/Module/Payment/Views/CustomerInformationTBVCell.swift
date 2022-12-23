//
//  CustomerInformationTBVCell.swift
//  HotelBooking
//
//  Created by MacOS on 22/12/2022.
//

import UIKit

class CustomerInformationTBVCell: UITableViewCell {

    @IBOutlet weak var viewCustomerInfo: UIView!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfFullName: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    func makeShadow(view: UITextField){
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 4
    }

    
    func setupUI(){
        tfEmail.layer.cornerRadius = 8
        tfFullName.layer.cornerRadius = 8
        tfPhoneNumber.layer.cornerRadius = 8
        viewCustomerInfo.layer.cornerRadius = 8
        HomeManager.shared.makeShadow(view: viewCustomerInfo)
        makeShadow(view: tfEmail)
        makeShadow(view: tfFullName)
        makeShadow(view: tfPhoneNumber)
        
    }

    static let identifier = "CustomerInformationTBVCell"
    static func nib() -> UINib{
        return UINib(nibName: "CustomerInformationTBVCell", bundle: nil)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CustomerInformationTBVCell: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.contentView.endEditing(true)
        return false
    }
}
