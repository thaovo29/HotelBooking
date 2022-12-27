//
//  HotelItemTBVCell.swift
//  HotelBooking
//
//  Created by MacOS on 21/12/2022.
//

import UIKit

class HotelItemTBVCell: UITableViewCell {

    @IBOutlet weak var viewPrice: UIView!
    @IBOutlet weak var viewaddress: UIView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var viewRating: UIView!
    @IBOutlet weak var lblHotelName: UILabel!
    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var containView: UIView!
    
    var callBackSeeDetail : (()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL?){
        guard let url = url else {return}
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.imgItem.image = UIImage(data: data)
                self?.setupUI()
            }
        }

    }
    
    func setupUI(){
        imgItem.layer.cornerRadius = 8
        containView.layer.cornerRadius = 8
        HomeManager.shared.makeShadow(view: containView)
        viewaddress.translatesAutoresizingMaskIntoConstraints = false
        viewaddress.widthAnchor.constraint(equalTo: imgItem.widthAnchor, multiplier: 5/8).isActive = true
        let gestureSeeDetail = UITapGestureRecognizer(target: self, action: #selector(seeDetail))
        containView.addGestureRecognizer(gestureSeeDetail)
    }
    
    @objc func seeDetail(){
        self.callBackSeeDetail?()
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
    
    func configure(with model: HotelSearchItem, isShownPrice: Bool = true){
        let url = URL(string: model.imageURL)
        downloadImage(from: url)
        self.lblHotelName.text = model.name
        if let price = model.room.first?.price {
            self.lblPrice.text = "$\(price)"
        }
        self.lblAddress.text = model.address
        setStarRatingView(rate: model.rate)
        viewPrice.isHidden = !isShownPrice
    }
}
