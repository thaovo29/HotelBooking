//
//  DiscoverMoreCollectionViewCell.swift
//  HotelBooking
//
//  Created by MacOS on 19/12/2022.
//

import UIKit

class DiscoverMoreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewContain: UIView!
    @IBOutlet weak var imgPoster: UIImageView!
    var link: String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupUI(){
        viewContain.layer.cornerRadius = 8
        viewContain.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        viewContain.layer.shadowOpacity = 1
        viewContain.layer.shadowOffset = CGSize(width: 0, height: 4)
        viewContain.layer.shadowRadius = 4
        imgPoster.layer.cornerRadius = 8
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.openLink))
        viewContain.addGestureRecognizer(gesture)
    }
    static let identifier = "DiscoverMoreCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "DiscoverMoreCollectionViewCell",
                     bundle: nil)
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL?){
        guard let url = url else {return}
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.imgPoster.image = UIImage(data: data)
                self?.setupUI()
            }
        }

    }
    
    @objc func openLink(){
        guard let link = self.link else {return}
        guard let url = URL(string: link) else { return }
        UIApplication.shared.open(url)
    }
    
    func configure(with model: DiscoverMoreModel){
        let url = URL(string:model.image)
        downloadImage(from: url)
        self.link = model.link
    }
}
