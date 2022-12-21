//
//  HotelCustomVC.swift
//  HotelBooking
//
//  Created by MacOS on 19/12/2022.
//

import UIKit

class HotelCustomVC: UIViewController {

    @IBOutlet weak var lblCheckIn: UILabel!
    @IBOutlet weak var viewCheckIn: UIView!
    @IBOutlet weak var viewCheckOut: UIView!
    @IBOutlet weak var navbar: NavBottomBar!
    @IBOutlet weak var bgNav: UIView!
    @IBOutlet weak var viewHeadCount: UIView!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var lblHeadCount: UILabel!
    
    @IBOutlet weak var lblDayCO: UIDatePicker!
    @IBOutlet weak var lblDayCI: UIDatePicker!
    @IBOutlet weak var lblCheckOut: UILabel!
    @IBOutlet weak var viewTicket: UIView!
    @IBOutlet weak var tfSearchPlace: UITextField!
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var viewHeaderTitle: HeaderTitle!
    
    var vm = HotelCustomVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.setup()
        setupUI()
        setupVM()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: false)
        }
    func setUIForHeadCount(){
        guard let room = vm.roomNo, let adult = vm.adultNo, let child = vm.childNo else {return}
        
        var str = ""
        str += "\(room)"
        if room > 1 { str += " Rooms "}
        else {str += " Room "}
        
        str += "\(adult)"
        if adult > 1 { str += " Adults "}
        else {str += " Adult "}
        
        str += "\(child)"
        if child == 1 {str += " Child "}
        else {str += " Children "}
        lblHeadCount.text = str
    }
    
    func setupVM(){
        vm.callBackUpdateHeadCount = { [weak self] room, adult, child in
//            self?.vm.setMember(adult: adult, room: room, child: child)
            self?.setUIForHeadCount()
        }
    }
    
    func setupUI(){
        viewHeaderTitle.lblTitle.text = "Hotel"
        tfSearchPlace.layer.borderWidth = 1
        tfSearchPlace.layer.borderColor = UIColor(red: 139/255.0, green: 140/255.0, blue: 154/255.0, alpha: 1).cgColor
        tfSearchPlace.layer.cornerRadius = 8
        tfSearchPlace.delegate = self
        
        viewHeadCount.layer.cornerRadius = 8
        viewHeadCount.layer.borderWidth = 1
        viewHeadCount.layer.borderColor = UIColor(red: 139/255.0, green: 140/255.0, blue: 154/255.0, alpha: 1).cgColor
        
        btnSearch.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        btnSearch.layer.cornerRadius = 8
        
        containView.layer.cornerRadius = 8
        HomeManager.shared.makeShadow(view: containView)
        bgNav.layer.cornerRadius = 16
        bgNav.backgroundColor = UIColor(red: 37/255.0, green: 75/255.0, blue: 160/255.0, alpha: 1)
        navbar.layer.cornerRadius = 16
        setPosition()
        setUIForHeadCount()
        viewHeadCount.isUserInteractionEnabled = true
        let gestureOpenMember = UITapGestureRecognizer(target: self, action:  #selector (self.openSelectNumber))
        viewHeadCount.addGestureRecognizer(gestureOpenMember)
        lblDayCI.minimumDate = Date()
        lblDayCO.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())
        tfSearchPlace.leftViewMode = UITextField.ViewMode.always

        tfSearchPlace.leftViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 5, y: 0, width: 20, height: 20))
        let image = UIImage(named: "ic-search")
        imageView.image = image
        tfSearchPlace.leftView = imageView
    }
    
    @IBAction func ClickToSearch(_ sender: Any) {
        vm.pushToHotelSearch(vc: self)
    }
    @objc func openSelectNumber(){
        vm.presentSelectNumber(vc: self)
    }
    
    func setPosition(){
        viewCheckIn.translatesAutoresizingMaskIntoConstraints = false
        viewCheckOut.translatesAutoresizingMaskIntoConstraints = false
        lblCheckOut.translatesAutoresizingMaskIntoConstraints = false
        lblDayCO.translatesAutoresizingMaskIntoConstraints = false
        lblDayCI.translatesAutoresizingMaskIntoConstraints = false
        lblCheckIn.translatesAutoresizingMaskIntoConstraints = false
        viewCheckOut.backgroundColor = .none
        viewCheckIn.backgroundColor = .none
        
        NSLayoutConstraint.activate([
            viewCheckIn.leadingAnchor.constraint(equalTo: viewTicket.leadingAnchor, constant: 5),
            viewCheckIn.widthAnchor.constraint(equalTo: viewTicket.widthAnchor, multiplier: 1/2),
            lblCheckIn.topAnchor.constraint(equalTo: viewCheckIn.topAnchor),
            lblCheckIn.leadingAnchor.constraint(equalTo: viewCheckIn.leadingAnchor, constant: 5),
            lblDayCI.leadingAnchor.constraint(equalTo: lblCheckIn.leadingAnchor),
            lblDayCI.topAnchor.constraint(equalTo: lblCheckIn.bottomAnchor, constant: 5),
            viewCheckIn.centerYAnchor.constraint(equalTo: viewTicket.centerYAnchor),
            viewCheckIn.bottomAnchor.constraint(equalTo: lblDayCI.bottomAnchor),
            
            viewCheckOut.leadingAnchor.constraint(equalTo: viewCheckIn.trailingAnchor),
            viewCheckOut.widthAnchor.constraint(equalTo: viewTicket.widthAnchor, multiplier: 1/2),
            lblCheckOut.topAnchor.constraint(equalTo: viewCheckOut.topAnchor),
            lblCheckOut.leadingAnchor.constraint(equalTo: viewCheckOut.leadingAnchor, constant: 5),
            lblDayCO.topAnchor.constraint(equalTo: lblCheckOut.bottomAnchor, constant: 5),
            lblDayCO.leadingAnchor.constraint(equalTo: lblCheckOut.leadingAnchor),
            viewCheckOut.bottomAnchor.constraint(equalTo: lblDayCO.bottomAnchor),
            viewCheckOut.centerYAnchor.constraint(equalTo: viewTicket.centerYAnchor)
            
        ])
    }
    
}

extension HotelCustomVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        vm.places = tfSearchPlace.text
        return false
    }
}


