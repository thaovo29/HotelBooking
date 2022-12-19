//
//  HotelCustomVC.swift
//  HotelBooking
//
//  Created by MacOS on 19/12/2022.
//

import UIKit

class HotelCustomVC: UIViewController {

    @IBOutlet weak var viewHeaderTitle: HeaderTitle!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        viewHeaderTitle.lblTitle.text = "Hotel"
    }
}
