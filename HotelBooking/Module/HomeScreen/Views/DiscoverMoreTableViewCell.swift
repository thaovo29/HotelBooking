//
//  DiscoverMoreTableViewCell.swift
//  HotelBooking
//
//  Created by MacOS on 19/12/2022.
//

import UIKit

class DiscoverMoreTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let windowWidth = UIScreen.main.bounds.size.width
    @IBOutlet weak var collectionView: UICollectionView!
    var models = [DiscoverMoreModel]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DiscoverMoreCollectionViewCell.nib(), forCellWithReuseIdentifier: DiscoverMoreCollectionViewCell.identifier)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    static let identifier = "DiscoverMoreTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "DiscoverMoreTableViewCell",
                     bundle: nil)
    }
    
    func configure(with models: [DiscoverMoreModel]){
        self.models = models
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (windowWidth - 50 - 30) / 2
        let cellHeight = (cellWidth * 220) / 150
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverMoreCollectionViewCell.identifier, for: indexPath) as! DiscoverMoreCollectionViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
}


