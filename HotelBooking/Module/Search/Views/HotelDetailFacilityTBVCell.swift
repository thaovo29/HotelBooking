//
//  HotelDetailFacilityTBVCell.swift
//  HotelBooking
//
//  Created by MacOS on 21/12/2022.
//

import UIKit

class HotelDetailFacilityTBVCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var line: UIView!
    var model: [Facility]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FacilityCollectionViewCell.nib(), forCellWithReuseIdentifier: FacilityCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static let identifier = "HotelDetailFacilityTBVCell"
    static func nib() -> UINib {
        return UINib(nibName: "HotelDetailFacilityTBVCell", bundle: nil)
    }
    
    func configure(with model: [Facility]){
        self.model = model
        collectionView.reloadData()
    }
    
}

extension HotelDetailFacilityTBVCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FacilityCollectionViewCell.identifier, for: indexPath) as? FacilityCollectionViewCell
        else {return UICollectionViewCell()}
        if let facility = model?[indexPath.row] {
            cell.configure(with: facility)
        }
        return cell
    }
    
}
