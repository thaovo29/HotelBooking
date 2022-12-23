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
    @IBOutlet weak var viewNavBottom: NavBottomBar!
    @IBOutlet weak var viewHeader: HeaderTitle!
    var orderDetail: OrderDetailModel?
    var place: String = ""
    var vm = HotelSearchVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfSearchPlace.delegate = self
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "HotelItemTBVCell", bundle: nil), forCellReuseIdentifier: "HotelItemTBVCell")
        
        setupUI()
        setupVM()
        // Do any additional setup after loading the view.
    }
    func setupUI(){
        viewHeader.lblTitle.text = "Search"
        HomeManager.shared.makeShadow(view: viewHeader)
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
        viewBGNav.layer.cornerRadius = 16
        viewBGNav.backgroundColor = UIColor(red: 37/255.0, green: 75/255.0, blue: 160/255.0, alpha: 1)
        viewNavBottom.layer.cornerRadius = 16
    }
    
    func setupVM(){
        vm.bindData(orderDetail: orderDetail, place: place)
        vm.callbackReloadData = { [weak self] in
            self?.table.reloadData()
        }
        vm.getHotelData()
    }
 
}

extension HotelSearchVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.hotelItemsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: "HotelItemTBVCell") as? HotelItemTBVCell
            else { return UITableViewCell()}
        cell.configure(with: vm.hotelItemsModel[indexPath.row])
        cell.callBackSeeDetail = {[weak self] in
            guard let self = self else{return}
            self.vm.pushToSeeDetail(vc: self, model: indexPath.row)
        }
        return cell
    }
   
}

extension HotelSearchVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
//        vm.places = tfSearchPlace.text
        return false
    }
}
