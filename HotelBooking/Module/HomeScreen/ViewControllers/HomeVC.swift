//
//  ViewController.swift
//  HotelBooking
//
//  Created by MacOS on 18/12/2022.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var bottomNavMain: NavBottomBar!
    @IBOutlet weak var bottomNav: UIView!
    @IBOutlet weak var table: UITableView!
    let vm = HomeVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        setupVM()
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: false)
        }
    
    func setupUI(){
        bottomNav.backgroundColor = UIColor(red: 37/255.0, green: 75/255.0, blue: 160/255.0, alpha: 1)
        bottomNav.layer.cornerRadius = 16
        bottomNavMain.layer.cornerRadius = 16
        
        table.delegate = self
        table.dataSource = self
        table.register(HomeCategoriesTableViewCell.nib(),
                       forCellReuseIdentifier: HomeCategoriesTableViewCell.identifier)
        table.register(DiscoverMoreTableViewCell.nib(), forCellReuseIdentifier: DiscoverMoreTableViewCell.identifier)
    }
    func setupVM(){
        vm.callbackReloadData = { [weak self] in
            self?.table.reloadData()
        }
        vm.getDiscoverData()
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            guard let cell = table.dequeueReusableCell(withIdentifier: HomeCategoriesTableViewCell.identifier) as? HomeCategoriesTableViewCell else {return UITableViewCell()}
            cell.navCallBack = {[weak self] navType in
                guard let self = self else {return}
                DispatchQueue.main.async {
                    switch(navType) {
                    case .Hotel:
                        HomeManager.shared.pushToHotelSearch(vc: self)
                    case .Apartment:
                        HomeManager.shared.pushToApartmentSearch(vc: self)
                    case .Resort:
                        HomeManager.shared.pushToResortSearch(vc: self)
                    default:
                        HomeManager.shared.pushToHomestaySearch(vc: self)
                    }
                }
                
            }
            return cell
        }
        guard let cell = table.dequeueReusableCell(withIdentifier: DiscoverMoreTableViewCell.identifier) as? DiscoverMoreTableViewCell else {return UITableViewCell()}
        cell.configure(with: vm.discoverMoreModels)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1{
            return 850
        }
        return 400
    }
}
