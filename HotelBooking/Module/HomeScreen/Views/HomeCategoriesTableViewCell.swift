//
//  HomeCategoriesTableViewCell.swift
//  HotelBooking
//
//  Created by MacOS on 18/12/2022.
//

import UIKit

class HomeCategoriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblHello: UILabel!
    @IBOutlet weak var viewResort: UIView!
    @IBOutlet weak var viewApartment: UIView!
    @IBOutlet weak var viewHotel: UIView!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var viewHomestay: UIView!
    
    @IBOutlet weak var ic_Hotel: UIImageView!
    @IBOutlet weak var ic_Apartment: UIImageView!
    @IBOutlet weak var ic_Homestay: UIImageView!
    @IBOutlet weak var ic_Resort: UIImageView!
    
    @IBOutlet weak var lblHotel: UILabel!
    @IBOutlet weak var lblApartment: UILabel!
    @IBOutlet weak var lblResort: UILabel!
    @IBOutlet weak var lblHomestay: UILabel!
    
    var navCallBack: ((searchType) -> Void)?
    var viewWidth = (UIScreen.main.bounds.size.width - 70) / 2
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    static let identifier = "HomeCategoriesTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HomeCategoriesTableViewCell",
                     bundle: nil)
    }
    
    func makeShadow(view: UIView){
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 4
    }
    @objc func navHotel(){
        self.navCallBack?(searchType.Hotel)
    }
    func setUIforHotelView(){
        // position
        viewHotel.translatesAutoresizingMaskIntoConstraints = false
        viewHotel.topAnchor.constraint(equalTo: lblSubtitle.bottomAnchor, constant: 30).isActive = true
        viewHotel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25).isActive = true
        viewHotel.widthAnchor.constraint(equalToConstant: viewWidth).isActive = true
        viewHotel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        makeShadow(view: viewHotel)
        viewHotel.layer.cornerRadius = 8
        
        // ic position
        ic_Hotel.translatesAutoresizingMaskIntoConstraints = false
        ic_Hotel.topAnchor.constraint(equalTo: viewHotel.topAnchor, constant: 10).isActive = true
        ic_Hotel.widthAnchor.constraint(equalToConstant: 54).isActive = true
        ic_Hotel.heightAnchor.constraint(equalToConstant: 54).isActive = true
        ic_Hotel.centerXAnchor.constraint(equalTo: viewHotel.centerXAnchor).isActive = true
        
        // lbl position
        lblHotel.translatesAutoresizingMaskIntoConstraints = false
        lblHotel.topAnchor.constraint(equalTo: ic_Hotel.bottomAnchor, constant: 3).isActive = true
        lblHotel.centerXAnchor.constraint(equalTo: viewHotel.centerXAnchor).isActive = true
        
        //navigation
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.navHotel))
        viewHotel.addGestureRecognizer(gesture)
    }
    
    func setUIforApartmentView(){
        viewApartment.translatesAutoresizingMaskIntoConstraints = false
        
        viewApartment.topAnchor.constraint(equalTo: lblSubtitle.bottomAnchor, constant: 30).isActive = true
        contentView.trailingAnchor.constraint(equalTo: viewApartment.trailingAnchor, constant: 25).isActive = true
        viewApartment.widthAnchor.constraint(equalToConstant: viewWidth).isActive = true
        viewApartment.leadingAnchor.constraint(equalTo: viewHotel.trailingAnchor, constant: 20).isActive = true
        viewApartment.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        makeShadow(view: viewApartment)
        viewApartment.layer.cornerRadius = 8

        ic_Apartment.translatesAutoresizingMaskIntoConstraints = false
        ic_Apartment.topAnchor.constraint(equalTo: viewApartment.topAnchor, constant: 10).isActive = true
        ic_Apartment.widthAnchor.constraint(equalToConstant: 54).isActive = true
        ic_Apartment.heightAnchor.constraint(equalToConstant: 54).isActive = true
        ic_Apartment.centerXAnchor.constraint(equalTo: viewApartment.centerXAnchor).isActive = true
        
        lblApartment.translatesAutoresizingMaskIntoConstraints = false
        lblApartment.topAnchor.constraint(equalTo: ic_Apartment.bottomAnchor, constant: 3).isActive = true
        lblApartment.centerXAnchor.constraint(equalTo: viewApartment.centerXAnchor).isActive = true
        //navigation
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.navApartment))
        viewApartment.addGestureRecognizer(gesture)
    }
    
    @objc func navApartment(){
        self.navCallBack?(searchType.Apartment)
    }
    
    func setUIforResortView(){
        viewResort.translatesAutoresizingMaskIntoConstraints = false
        viewResort.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25).isActive = true
        viewResort.widthAnchor.constraint(equalToConstant: viewWidth).isActive = true
        viewResort.heightAnchor.constraint(equalToConstant: 100).isActive = true
        viewResort.topAnchor.constraint(equalTo: viewHotel.bottomAnchor, constant: 25).isActive = true
        contentView.bottomAnchor.constraint(equalTo: viewResort.bottomAnchor, constant: 20).isActive = true
        
        makeShadow(view: viewResort)

        viewResort.layer.cornerRadius = 8
        
        ic_Resort.translatesAutoresizingMaskIntoConstraints = false
        ic_Resort.topAnchor.constraint(equalTo: viewResort.topAnchor, constant: 10).isActive = true
        ic_Resort.widthAnchor.constraint(equalToConstant: 54).isActive = true
        ic_Resort.heightAnchor.constraint(equalToConstant: 54).isActive = true
        ic_Resort.centerXAnchor.constraint(equalTo: viewResort.centerXAnchor).isActive = true
        
        
        lblResort.translatesAutoresizingMaskIntoConstraints = false
        lblResort.topAnchor.constraint(equalTo: ic_Resort.bottomAnchor, constant: 3).isActive = true
        lblResort.centerXAnchor.constraint(equalTo: viewResort.centerXAnchor).isActive = true
        
        //navigation
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.navResort))
        viewResort.addGestureRecognizer(gesture)
    }
    
    @objc func navResort(){
        self.navCallBack?(searchType.Resort)
    }
    func setUIforHomestayView(){
        viewHomestay.translatesAutoresizingMaskIntoConstraints = false
        contentView.trailingAnchor.constraint(equalTo: viewHomestay.trailingAnchor, constant: 25).isActive = true
        viewHomestay.widthAnchor.constraint(equalToConstant: viewWidth).isActive = true
        viewHomestay.leadingAnchor.constraint(equalTo: viewHotel.trailingAnchor, constant: 20).isActive = true
        viewHomestay.heightAnchor.constraint(equalToConstant: 100).isActive = true
        viewHomestay.topAnchor.constraint(equalTo: viewHotel.bottomAnchor, constant: 25).isActive = true
        
        makeShadow(view: viewHomestay)
        
        viewHomestay.layer.cornerRadius = 8
        
        ic_Homestay.translatesAutoresizingMaskIntoConstraints = false
        ic_Homestay.topAnchor.constraint(equalTo: viewHomestay.topAnchor, constant: 10).isActive = true
        ic_Homestay.widthAnchor.constraint(equalToConstant: 54).isActive = true
        ic_Homestay.heightAnchor.constraint(equalToConstant: 54).isActive = true
        ic_Homestay.centerXAnchor.constraint(equalTo: viewHomestay.centerXAnchor).isActive = true
        
        lblHomestay.translatesAutoresizingMaskIntoConstraints = false
        lblHomestay.topAnchor.constraint(equalTo: ic_Homestay.bottomAnchor, constant: 3).isActive = true
        lblHomestay.centerXAnchor.constraint(equalTo: viewHomestay.centerXAnchor).isActive = true
        
        //navigation
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.navHomestay))
        viewHomestay.addGestureRecognizer(gesture)
    }
    
    @objc func navHomestay(){
        self.navCallBack?(searchType.Homestay)
    }
    
    func setHello(){
        let hour = Calendar.current.component(.hour, from: Date())
        if 0 < hour && hour < 12{
            lblHello.text = "Good morning!"
        } else if (hour < 18){
            lblHello.text = "Good afternoon!"
        } else {
            lblHello.text = "Good evening!"
        }
    }
    func setupUI(){
        setHello()
        setUIforHotelView()
        setUIforApartmentView()
        setUIforResortView()
        setUIforHomestayView()

    }
    
}

enum searchType{
case Hotel
case Apartment
case Resort
case Homestay
}
