//
//  LocationTableViewCell.swift
//  HotelBooking
//
//  Created by MacOS on 27/12/2022.
//

import UIKit
import GoogleMaps

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setupUI(lat: Float, long: Float, hotelName:String){
        
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(long), zoom: 18.0)
        let mapView = GMSMapView.map(withFrame: view.bounds, camera: camera)

        mapView.layer.cornerRadius = 8
        view.addSubview(mapView)

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(long))
        marker.title = hotelName
//        marker.snippet = "Australia"
        marker.map = mapView
        
    }
    static let identifier = "LocationTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "LocationTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
