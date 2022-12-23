//
//  FacilityCollectionViewCell.swift
//  HotelBooking
//
//  Created by MacOS on 21/12/2022.
//

import UIKit

class FacilityCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewContain: UIView!
    @IBOutlet weak var imgFacility: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    func setupUI(){
        viewContain.layer.cornerRadius = 8
        HomeManager.shared.makeShadow(view: viewContain)
    }
    
    static let identifier = "FacilityCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "FacilityCollectionViewCell", bundle: nil)
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL?){
        guard let url = url else {return}
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.imgFacility.image = UIImage(data: data)
                self?.setupUI()
            }
        }
    }
    
    func configure(with model: Facility){
        let url = URL(string: model.iconURL)
        downloadImage(from: url)
    }
    
}
