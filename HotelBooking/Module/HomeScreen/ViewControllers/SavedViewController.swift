//
//  SavedViewController.swift
//  HotelBooking
//
//  Created by MacOS on 23/12/2022.
//

import UIKit

class SavedViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var bgNavView: UIView!
    @IBOutlet weak var navView: NavBottomBar!
    @IBOutlet weak var headerView: HeaderTitle!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        headerView.lblTitle.text = "Saved"
        navView.layer.cornerRadius = 16
        bgNavView.layer.cornerRadius = 16
        navView.backgroundColor = UIColor(red: 37/255.0, green: 75/255.0, blue: 160/255.0, alpha: 1)
        bgNavView.backgroundColor = UIColor(red: 37/255.0, green: 75/255.0, blue: 160/255.0, alpha: 1)
        
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "HotelItemTBVCell", bundle: nil), forCellReuseIdentifier: "HotelItemTBVCell")
    }
}

extension SavedViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeManager.shared.saved.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: "HotelItemTBVCell") as? HotelItemTBVCell
        else {return UITableViewCell()}
        cell.configure(with: HomeManager.shared.saved[indexPath.row], isShownPrice: false)
        
        return cell
    }    
}
