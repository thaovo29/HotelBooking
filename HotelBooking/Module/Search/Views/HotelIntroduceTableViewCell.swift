//
//  HotelIntroduceTableViewCell.swift
//  HotelBooking
//
//  Created by MacOS on 21/12/2022.
//

import UIKit

class HotelIntroduceTableViewCell: UITableViewCell {

    @IBOutlet weak var line: UIView!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var RatingView: UIView!
    @IBOutlet weak var lblHotelName: UILabel!
    @IBOutlet weak var imgHotel: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    func setupUI(){
        line.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static let identifier = "HotelIntroduceTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "HotelIntroduceTableViewCell", bundle: nil)
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL?){
        guard let url = url else {return}
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.imgHotel.image = UIImage(data: data)
                self?.setupUI()
            }
        }
    }
    func setStarRatingView(rate: Int){
        RatingView.translatesAutoresizingMaskIntoConstraints = false
        for i in 0..<rate {
            var img = UIImageView(image: UIImage(named: "ic_star"))
            RatingView.addSubview(img)
            img.translatesAutoresizingMaskIntoConstraints = false
            img.centerYAnchor.constraint(equalTo: RatingView.centerYAnchor).isActive = true
            img.leadingAnchor.constraint(equalTo: RatingView.leadingAnchor, constant: CGFloat(i * 15 + i * 2)).isActive = true
            img.widthAnchor.constraint(equalToConstant: 15).isActive = true
            img.heightAnchor.constraint(equalToConstant: 15).isActive = true
            
        }
    }
    func configure(with model: HotelSearchItem){
        let url = URL(string: model.imageURL)
        downloadImage(from: url)
        lblHotelName.text = model.name
        lblAddress.text = model.address
        setStarRatingView(rate: model.rate)
    }
    
}
