//
//  CustomerInfomationBookingTBVCell.swift
//  HotelBooking
//
//  Created by MacOS on 23/12/2022.
//

import UIKit

class CustomerInfomationBookingTBVCell: UITableViewCell {

    @IBOutlet weak var lblPayment: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblCustomerName: UILabel!
    @IBOutlet weak var viewContain: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
        // Configure the view for the selected state
    }
    
    func setupUI(){
        HomeManager.shared.makeShadow(view: viewContain)
        viewContain.layer.cornerRadius = 8
    }
    
    static let identifier = "CustomerInfomationBookingTBVCell"
    static func nib() -> UINib{
        return UINib(nibName: "CustomerInfomationBookingTBVCell", bundle: nil)
    }
    
    func configure(order: OrderDetailModel){
        self.lblCustomerName.text = "Customer Name: \(order.customerName)"
        self.lblEmail.text = "Email: \(order.customerEmail)"
        self.lblPhone.text = "Phone number: \(order.customerPhone)"
        self.lblPayment.text = "Payment method: \(order.paymentMethod)"
    }
}
