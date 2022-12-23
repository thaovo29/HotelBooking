//
//  HotelInfomationTBVCell.swift
//  HotelBooking
//
//  Created by MacOS on 22/12/2022.
//

import UIKit

class HotelInfomationTBVCell: UITableViewCell {

    @IBOutlet weak var viewCICO: UIView!
    @IBOutlet weak var viewRoom: UIView!
    @IBOutlet weak var viewHotel: UIView!
    @IBOutlet weak var lblBed: UILabel!
    @IBOutlet weak var lblPeople: UILabel!
    @IBOutlet weak var imgRoom: UIImageView!
    @IBOutlet weak var lblRoomName: UILabel!
    @IBOutlet weak var lblDayCheckOut: UILabel!
    @IBOutlet weak var lblCheckOut: UILabel!
    @IBOutlet weak var viewCheckOut: UIView!
    @IBOutlet weak var lblDayCheckIn: UILabel!
    @IBOutlet weak var lblCheckIn: UILabel!
    @IBOutlet weak var viewCheckIn: UIView!
    @IBOutlet weak var viewRating: UIView!
    @IBOutlet weak var lblHotelName: UILabel!
    
    @IBOutlet weak var imgHotel: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    static let identifier = "HotelInfomationTBVCell"
    static func nib() -> UINib{
        return UINib(nibName: "HotelInfomationTBVCell", bundle: nil)
    }
    
    func setupUI(){
        HomeManager.shared.makeShadow(view: viewHotel)
        HomeManager.shared.makeShadow(view: viewRoom)
        viewHotel.layer.cornerRadius = 8
        imgHotel.layer.cornerRadius = 8
        viewRoom.layer.cornerRadius = 8
        imgRoom.layer.cornerRadius = 8
        viewCICO.translatesAutoresizingMaskIntoConstraints = false
        viewCheckIn.translatesAutoresizingMaskIntoConstraints = false
        viewCheckOut.translatesAutoresizingMaskIntoConstraints = false
        lblCheckIn.translatesAutoresizingMaskIntoConstraints = false
        lblCheckOut.translatesAutoresizingMaskIntoConstraints = false
        lblDayCheckIn.translatesAutoresizingMaskIntoConstraints = false
        lblDayCheckOut.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewCheckIn.topAnchor.constraint(equalTo: viewCICO.topAnchor),
            viewCheckIn.leadingAnchor.constraint(equalTo: viewCICO.leadingAnchor),
            viewCheckIn.bottomAnchor.constraint(equalTo: viewCICO.bottomAnchor),
            viewCheckIn.widthAnchor.constraint(equalTo: viewCICO.widthAnchor, multiplier: 1/2),
            
            viewCheckOut.topAnchor.constraint(equalTo: viewCICO.topAnchor),
            viewCheckOut.leadingAnchor.constraint(equalTo: viewCheckIn.trailingAnchor),
            viewCheckOut.bottomAnchor.constraint(equalTo: viewCICO.bottomAnchor),
            viewCheckOut.widthAnchor.constraint(equalTo: viewCICO.widthAnchor, multiplier: 1/2),
            
            lblCheckIn.topAnchor.constraint(equalTo: viewCheckIn.topAnchor, constant: 5),
            lblCheckIn.leadingAnchor.constraint(equalTo: viewCheckIn.leadingAnchor, constant: 20),
            
            lblDayCheckIn.leadingAnchor.constraint(equalTo: viewCheckIn.leadingAnchor, constant: 20),
            lblDayCheckIn.bottomAnchor.constraint(equalTo: viewCheckIn.bottomAnchor, constant: -5),
            
            lblCheckOut.topAnchor.constraint(equalTo: viewCheckOut.topAnchor, constant: 5),
            lblCheckOut.leadingAnchor.constraint(equalTo: viewCheckOut.leadingAnchor, constant: 20),
            
            lblDayCheckOut.leadingAnchor.constraint(equalTo: viewCheckOut.leadingAnchor, constant: 20),
            lblDayCheckOut.bottomAnchor.constraint(equalTo: viewCheckOut.bottomAnchor, constant: -5),
            
        ])
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL?, img: UIImageView){
        guard let url = url else {return}
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                img.image = UIImage(data: data)
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setStarRatingView(rate: Int){
        viewRating.translatesAutoresizingMaskIntoConstraints = false
        for i in 0..<rate {
            var img = UIImageView(image: UIImage(named: "ic_star"))
            viewRating.addSubview(img)
            img.translatesAutoresizingMaskIntoConstraints = false
            img.centerYAnchor.constraint(equalTo: viewRating.centerYAnchor).isActive = true
            img.leadingAnchor.constraint(equalTo: viewRating.leadingAnchor, constant: CGFloat(i * 15 + i * 2)).isActive = true
            img.widthAnchor.constraint(equalToConstant: 15).isActive = true
            img.heightAnchor.constraint(equalToConstant: 15).isActive = true
            
        }
    }
    
    func configure(orderDetail: OrderDetailModel){
        let hotelURL = URL(string: orderDetail.hotel.imageURL)
        let roomURL = URL(string: orderDetail.room.imageURL)
        downloadImage(from: hotelURL, img: self.imgHotel)
        downloadImage(from: roomURL, img: self.imgRoom)
        
        self.lblHotelName.text = orderDetail.hotel.name
        self.lblDayCheckIn.text = PaymentManager.shared.changeDateToEEEDDMMM(day: orderDetail.checkInDay)
        self.lblDayCheckOut.text = PaymentManager.shared.changeDateToEEEDDMMM(day: orderDetail.checkOutDay)
        lblRoomName.text = "\(orderDetail.roomNo) x \(orderDetail.room.roomName)"
        var strPeople = ""
        if orderDetail.adultNo > 1 {
            strPeople += "\(orderDetail.adultNo) Adults "
        } else {
            strPeople += "\(orderDetail.adultNo) Adult "
        }
        if orderDetail.childNo > 1 {
            strPeople += "\(orderDetail.childNo) Children"
        } else if orderDetail.childNo > 0 {
            strPeople += "\(orderDetail.childNo) Child"
        }
        self.lblPeople.text = strPeople
        self.lblBed.text = orderDetail.room.bed
        setStarRatingView(rate: orderDetail.hotel.rate)
    }
}
