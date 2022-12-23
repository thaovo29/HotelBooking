//
//  HotelDetailAboutTBVCell.swift
//  HotelBooking
//
//  Created by MacOS on 21/12/2022.
//

import UIKit

class HotelDetailAboutTBVCell: UITableViewCell {

    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var line: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static let identifier = "HotelDetailAboutTBVCell"
    static func nib() -> UINib {
        return UINib(nibName: "HotelDetailAboutTBVCell", bundle: nil)
    }
    
    func configure(with model: HotelSearchItem){
        self.lblDescription.text = model.description
    }
    
}
