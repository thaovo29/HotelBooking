//
//  HotelSearchVC.swift
//  HotelBooking
//
//  Created by MacOS on 21/12/2022.
//

import UIKit

class HotelSearchVC: UIViewController {

    @IBOutlet weak var tfSearchPlace: UITextField!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var viewBGNav: UIView!
    @IBOutlet weak var viewNavBottom: UIView!
    @IBOutlet weak var viewHeader: HeaderTitle!
    
    var place: String = ""
    var vm = HotelSearchVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        tfSearchPlace.delegate = self
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "HotelItemTBVCell", bundle: nil), forCellReuseIdentifier: "HotelItemTBVCell")
        setupUI()
        // Do any additional setup after loading the view.
    }
    func setupUI(){
        tfSearchPlace.leftViewMode = UITextField.ViewMode.always
        tfSearchPlace.leftViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 5, y: 0, width: 20, height: 20))
        let image = UIImage(named: "ic-search")
        imageView.image = image
        tfSearchPlace.leftView = imageView
        tfSearchPlace.layer.cornerRadius = 8
        tfSearchPlace.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        tfSearchPlace.layer.shadowOpacity = 1
        tfSearchPlace.layer.shadowOffset = CGSize(width: 0, height: 4)
        tfSearchPlace.layer.shadowRadius = 4
        
    }
 
}

extension HotelSearchVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension HotelSearchVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
//        vm.places = tfSearchPlace.text
        return false
    }
}
