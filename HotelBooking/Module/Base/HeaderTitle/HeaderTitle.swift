//
//  HeaderTitle.swift
//  HotelBooking
//
//  Created by MacOS on 19/12/2022.
//

import UIKit

class HeaderTitle: UIView {
    var viewBG = UIView()
    var back=UIImageView()
    var lblTitle = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        
    }
    func setupUI(){
        self.backgroundColor = .white
        
        viewBG.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        viewBG.translatesAutoresizingMaskIntoConstraints = false
        back.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        back.image = UIImage(named: "BackArrow")
        lblTitle.font = UIFont.systemFont(ofSize: 30.0, weight: .bold)
        lblTitle.textColor = UIColor(red: 0.145, green: 0.294, blue: 0.627, alpha: 1)
        viewBG.addSubview(back)
        viewBG.addSubview(lblTitle)
        self.addSubview(viewBG)
        
        NSLayoutConstraint.activate([
            viewBG.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
            viewBG.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 3),
            viewBG.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            viewBG.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 3),
            
            back.centerYAnchor.constraint(equalTo: viewBG.centerYAnchor),
            back.widthAnchor.constraint(equalToConstant: 16),
            back.heightAnchor.constraint(equalToConstant: 28),
            back.leadingAnchor.constraint(equalTo: viewBG.leadingAnchor, constant: 30),
            
            lblTitle.centerXAnchor.constraint(equalTo: viewBG.centerXAnchor),
            lblTitle.centerYAnchor.constraint(equalTo: viewBG.centerYAnchor)
        ])
        back.isUserInteractionEnabled = true
        let goBack = UITapGestureRecognizer(target: self, action: #selector(goBack))
        back.addGestureRecognizer(goBack)
    }
    @objc func goBack(){
        if let navigationController = self.window?.rootViewController as? UINavigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    
    
}
