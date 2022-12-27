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


class HeaderHotel: UIView {
    var viewBG = UIView()
    var back=UIImageView()
    var lblTitle = UILabel()
    var like = UIImageView()
    var isLiked: Bool = false
    var callBackLike : ((Bool)->Void)?
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
        like.translatesAutoresizingMaskIntoConstraints = false
        
        back.image = UIImage(named: "BackArrow")
        like.image = UIImage(named: "ic_heart")
        lblTitle.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        lblTitle.numberOfLines = 0
        lblTitle.textColor = UIColor(red: 0.145, green: 0.294, blue: 0.627, alpha: 1)
        viewBG.addSubview(back)
        viewBG.addSubview(lblTitle)
        viewBG.addSubview(like)
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
            
            lblTitle.leadingAnchor.constraint(equalTo: back.trailingAnchor, constant: 20),
            lblTitle.centerYAnchor.constraint(equalTo: viewBG.centerYAnchor),
            
            like.centerYAnchor.constraint(equalTo: viewBG.centerYAnchor),
            like.trailingAnchor.constraint(equalTo: viewBG.trailingAnchor, constant: -30),
            like.widthAnchor.constraint(equalToConstant: 40),
            like.heightAnchor.constraint(equalToConstant: 40),
            
            lblTitle.trailingAnchor.constraint(equalTo: like.leadingAnchor)
        ])
        back.isUserInteractionEnabled = true
        let goBack = UITapGestureRecognizer(target: self, action: #selector(goBack))
        back.addGestureRecognizer(goBack)
        let clickLike = UITapGestureRecognizer(target: self, action: #selector(liked))
        like.isUserInteractionEnabled = true
        like.addGestureRecognizer(clickLike)
        
        let addToSaved = UITapGestureRecognizer(target: self, action: #selector(addToSaved))
        like.addGestureRecognizer(addToSaved)
    }
    @objc func goBack(){
        if let navigationController = self.window?.rootViewController as? UINavigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    @objc func liked(){
        isLiked.toggle()
        if isLiked{
            like.image = UIImage(named: "ic_heart_fill")
        } else{
            like.image = UIImage(named: "ic_heart")
        }
    }
    
    @objc func addToSaved(){
        self.callBackLike?(isLiked)
    }
    
}
