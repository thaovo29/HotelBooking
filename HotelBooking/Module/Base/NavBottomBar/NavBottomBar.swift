//
//  NavBottomBar.swift
//  HotelBooking
//
//  Created by MacOS on 19/12/2022.
//

import UIKit

class NavBottomBar: UIView {
    
    var viewBG = UIView()
    var viewHome = UIView()
    var viewSaved = UIView()
    var viewBooking = UIView()
    var viewSetting = UIView()
    var ic_home = UIImageView(image: UIImage(named: "ic_home"))
    var ic_saved = UIImageView(image: UIImage(named: "ic_saved"))
    var ic_booking = UIImageView(image: UIImage(named: "ic_booking"))
    var ic_setting = UIImageView(image: UIImage(named: "ic_setting"))
    var lblHome = UILabel()
    var lblSaved = UILabel()
    var lblBooking = UILabel()
    var lblSetting = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        
    }
    func setupUI(){
        self.backgroundColor = UIColor(red: 37/255.0, green: 75/255.0, blue: 160/255.0, alpha: 1)
        viewBG.layer.cornerRadius = 16
        viewBG.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        viewBG.backgroundColor = UIColor(red: 37/255.0, green: 75/255.0, blue: 160/255.0, alpha: 1)
        
        viewHome.backgroundColor = UIColor(red: 37/255.0, green: 75/255.0, blue: 160/255.0, alpha: 1)
        viewSaved.backgroundColor = UIColor(red: 37/255.0, green: 75/255.0, blue: 160/255.0, alpha: 1)
        viewBooking.backgroundColor = UIColor(red: 37/255.0, green: 75/255.0, blue: 160/255.0, alpha: 1)
        viewSetting.backgroundColor = UIColor(red: 37/255.0, green: 75/255.0, blue: 160/255.0, alpha: 1)
        
        viewBG.translatesAutoresizingMaskIntoConstraints = false
        viewHome.translatesAutoresizingMaskIntoConstraints = false
        viewSaved.translatesAutoresizingMaskIntoConstraints = false
        viewBooking.translatesAutoresizingMaskIntoConstraints = false
        viewSetting.translatesAutoresizingMaskIntoConstraints = false
        
        ic_home.translatesAutoresizingMaskIntoConstraints = false
        ic_saved.translatesAutoresizingMaskIntoConstraints = false
        ic_booking.translatesAutoresizingMaskIntoConstraints = false
        ic_setting.translatesAutoresizingMaskIntoConstraints = false
        lblHome.translatesAutoresizingMaskIntoConstraints = false
        lblSaved.translatesAutoresizingMaskIntoConstraints = false
        lblBooking.translatesAutoresizingMaskIntoConstraints = false
        lblSetting.translatesAutoresizingMaskIntoConstraints = false
        
        lblHome.text = "Home"
        lblSaved.text = "Saved"
        lblBooking.text = "Booking"
        lblSetting.text = "Setting"
        
        lblHome.textColor = .white
        lblSaved.textColor = .white
        lblBooking.textColor = .white
        lblSetting.textColor = .white
        
        lblHome.font = UIFont.systemFont(ofSize: 12.0)
        lblSaved.font = UIFont.systemFont(ofSize: 12.0)
        lblBooking.font = UIFont.systemFont(ofSize: 12.0)
        lblSetting.font = UIFont.systemFont(ofSize: 12.0)
        
        viewHome.addSubview(ic_home)
        viewHome.addSubview(lblHome)
        
        viewSaved.addSubview(ic_saved)
        viewSaved.addSubview(lblSaved)
        
        viewBooking.addSubview(ic_booking)
        viewBooking.addSubview(lblBooking)
        
        viewSetting.addSubview(ic_setting)
        viewSetting.addSubview(lblSetting)
        
        viewBG.addSubview(viewHome)
        viewBG.addSubview(viewSaved)
        viewBG.addSubview(viewBooking)
        viewBG.addSubview(viewSetting)
        
        self.addSubview(viewBG)
        
        
        NSLayoutConstraint.activate([
            viewBG.topAnchor.constraint(equalTo: self.topAnchor),
            viewBG.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            viewBG.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBG.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            viewHome.widthAnchor.constraint(equalTo: viewBG.widthAnchor, multiplier: 1/4),
            viewSaved.widthAnchor.constraint(equalTo: viewBG.widthAnchor, multiplier: 1/4),
            viewBooking.widthAnchor.constraint(equalTo: viewBG.widthAnchor, multiplier: 1/4),
            viewSetting.widthAnchor.constraint(equalTo: viewBG.widthAnchor, multiplier: 1/4),
            
            viewHome.heightAnchor.constraint(equalTo: viewBG.heightAnchor, multiplier: 1),
            viewSaved.heightAnchor.constraint(equalTo: viewBG.heightAnchor, multiplier: 1),
            viewBooking.heightAnchor.constraint(equalTo: viewBG.heightAnchor, multiplier: 1),
            viewSetting.heightAnchor.constraint(equalTo: viewBG.heightAnchor, multiplier: 1),
            
            
            viewHome.topAnchor.constraint(equalTo: viewBG.topAnchor, constant: 0),
            viewHome.leadingAnchor.constraint(equalTo: viewBG.leadingAnchor, constant: 0),
            
            viewSaved.leadingAnchor.constraint(equalTo: viewHome.trailingAnchor, constant: 0),
            viewSaved.topAnchor.constraint(equalTo: viewBG.topAnchor, constant: 0),
            
            viewBooking.leadingAnchor.constraint(equalTo: viewSaved.trailingAnchor, constant: 0),
            viewBooking.topAnchor.constraint(equalTo: viewBG.topAnchor, constant: 0),
            
            viewSetting.leadingAnchor.constraint(equalTo: viewBooking.trailingAnchor, constant: 0),
            viewSetting.topAnchor.constraint(equalTo: viewBG.topAnchor, constant: 0),
            
            ic_home.widthAnchor.constraint(equalToConstant: 30),
            ic_home.heightAnchor.constraint(equalToConstant: 30),
            
            ic_saved.widthAnchor.constraint(equalToConstant: 30),
            ic_saved.heightAnchor.constraint(equalToConstant: 30),
            
            ic_booking.widthAnchor.constraint(equalToConstant: 30),
            ic_booking.heightAnchor.constraint(equalToConstant: 30),
            
            ic_setting.widthAnchor.constraint(equalToConstant: 30),
            ic_setting.heightAnchor.constraint(equalToConstant: 30),
            
            ic_home.topAnchor.constraint(equalTo: viewHome.topAnchor, constant: 8),
            ic_home.centerXAnchor.constraint(equalTo: viewHome.centerXAnchor),
            
            ic_saved.topAnchor.constraint(equalTo: viewSaved.topAnchor, constant: 8),
            ic_saved.centerXAnchor.constraint(equalTo: viewSaved.centerXAnchor),
            
            ic_booking.topAnchor.constraint(equalTo: viewBooking.topAnchor, constant: 8),
            ic_booking.centerXAnchor.constraint(equalTo: viewBooking.centerXAnchor),
            
            ic_setting.topAnchor.constraint(equalTo: viewSetting.topAnchor, constant: 8),
            ic_setting.centerXAnchor.constraint(equalTo: viewSetting.centerXAnchor),
            
            
            lblHome.topAnchor.constraint(equalTo: ic_home.bottomAnchor, constant: 7),
            lblHome.centerXAnchor.constraint(equalTo: viewHome.centerXAnchor),
            
            lblSaved.topAnchor.constraint(equalTo: ic_saved.bottomAnchor, constant: 7),
            lblSaved.centerXAnchor.constraint(equalTo: viewSaved.centerXAnchor),
            
            lblBooking.topAnchor.constraint(equalTo: ic_booking.bottomAnchor, constant: 7),
            lblBooking.centerXAnchor.constraint(equalTo: viewBooking.centerXAnchor),
            
            lblSetting.topAnchor.constraint(equalTo: ic_setting.bottomAnchor, constant: 7),
            lblSetting.centerXAnchor.constraint(equalTo: viewSetting.centerXAnchor),
            
        ])
        viewHome.isUserInteractionEnabled = true
        let tapHome = UIGestureRecognizer(target: self, action: #selector(goHome))
        viewHome.addGestureRecognizer(tapHome)
        
        let tapSaved = UIGestureRecognizer(target: self, action: #selector(goSaved))
        viewSaved.addGestureRecognizer(tapSaved)
        
        let tapBooking = UIGestureRecognizer(target: self, action: #selector(goBooking))
        viewBooking.addGestureRecognizer(tapBooking)
        
        let tapSetting = UIGestureRecognizer(target: self, action: #selector(goSetting))
        viewSetting.addGestureRecognizer(tapSetting)
        
    }
    @objc func goHome(){
        print(10)
        if let navigationController = self.window?.rootViewController as? UINavigationController {
            let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            navigationController.pushViewController(homeVC, animated: true)
        }
    }
    
    @objc func goSaved(){
        print(1)
        
    }
    @objc func goBooking(){
        print(1)
        
    }
    @objc func goSetting(){
        print(1)
        
    }
}
