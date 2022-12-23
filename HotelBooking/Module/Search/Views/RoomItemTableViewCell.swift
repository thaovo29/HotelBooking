//
//  RoomItemTableViewCell.swift
//  HotelBooking
//
//  Created by MacOS on 22/12/2022.
//

import UIKit

class RoomItemTableViewCell: UITableViewCell {

    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var btnReserve: UIButton!
    @IBOutlet weak var lblBed: UILabel!
    @IBOutlet weak var lblChild: UILabel!
    @IBOutlet weak var lblAdult: UILabel!
    @IBOutlet weak var lblArea: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblRoomName: UILabel!
    @IBOutlet weak var imgRoom: UIImageView!
    var callBackReserve : (()->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    func setupUI(){
        btnReserve.layer.cornerRadius = 8
        HomeManager.shared.makeShadow(view: containView)
        containView.layer.cornerRadius = 8
        imgRoom.layer.cornerRadius = 8
        
    }

    @IBAction func reserveRoom(_ sender: Any) {
        self.callBackReserve?()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static let identifier = "RoomItemTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "RoomItemTableViewCell", bundle: nil)
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL?){
        guard let url = url else {return}
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.imgRoom.image = UIImage(data: data)
                self?.setupUI()
            }
        }
    }
    
    func configure(with model: RoomItem){
        let url = URL(string: model.imageURL)
        downloadImage(from: url)
        self.lblRoomName.text = model.roomName
        self.lblPrice.text = "$\(model.price)/night"
        self.lblArea.text = "\(model.area) m2"
        self.lblAdult.text = model.adult
        self.lblChild.text = model.child
        self.lblBed.text = model.bed
    }
    
}
