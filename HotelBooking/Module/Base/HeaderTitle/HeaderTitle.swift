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
        viewBG.layer.shadowColor = UIColor.black.cgColor
        viewBG.layer.shadowOffset = CGSize(width: 1, height: -3)
        viewBG.layer.shadowOpacity = 0.1
        viewBG.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        viewBG.translatesAutoresizingMaskIntoConstraints = false
        back.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        back.image = UIImage(named: "BackArrow")
        lblTitle.font = UIFont.systemFont(ofSize: 30.0, weight: .bold)
        
        viewBG.addSubview(back)
        viewBG.addSubview(lblTitle)
        self.addSubview(viewBG)
        
        
        NSLayoutConstraint.activate([
            viewBG.topAnchor.constraint(equalTo: self.topAnchor),
            viewBG.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            viewBG.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewBG.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            back.centerYAnchor.constraint(equalTo: viewBG.centerYAnchor),
            back.widthAnchor.constraint(equalToConstant: 16),
            back.heightAnchor.constraint(equalToConstant: 28),
            
            lblTitle.centerXAnchor.constraint(equalTo: viewBG.centerXAnchor)
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
