//
//  HomeManager.swift
//  HotelBooking
//
//  Created by MacOS on 19/12/2022.
//

import Foundation
import UIKit
class HomeManager {
    public static var shared = HomeManager()
    private let kHome = "Home"
    
    func pushToHotelSearch(vc: UIViewController){
        print(1)
        let sb = UIStoryboard(name: "Search", bundle: nil)
        let hotelSearch = sb.instantiateViewController(withIdentifier: "HotelCustomVC") as! HotelCustomVC
        vc.navigationController?.pushViewController(hotelSearch, animated: true)
    }
    
    func pushToApartmentSearch(vc: UIViewController){
        print(2)
        
        //        let sb = UIStoryboard(name: "Home", bundle: nil)
        //        let ApartmentSearch = sb.instantiateViewController(withIdentifier: "ApartmentSearchVC") as! ApartmentSearchVC
        //        vc.navigationController?.pushViewController(ApartmentSearch, animated: true)
    }
    @objc func pushToResortSearch(vc: UIViewController){
        //        let sb = UIStoryboard(name: "Home", bundle: nil)
        //        let ResortSearch = sb.instantiateViewController(withIdentifier: "ResortSearchVC") as! ResortSearchVC
        //        vc.navigationController?.pushViewController(ResortSearch, animated: true)
    }
    
    func pushToHomestaySearch(vc: UIViewController){
        //        let sb = UIStoryboard(name: "Home", bundle: nil)
        //        let HomestaySearch = sb.instantiateViewController(withIdentifier: "HomestaySearchVC") as! HomestaySearchVC
        //        vc.navigationController?.pushViewController(HomestaySearch, animated: true)
    }
    
    func pushToHome(vc: UIViewController){
        print(1)
        //        let sb = UIStoryboard(name: "Home", bundle: nil)
        //        let HomestaySearch = sb.instantiateViewController(withIdentifier: "HomestaySearchVC") as! HomestaySearchVC
        //        vc.navigationController?.pushViewController(HomestaySearch, animated: true)
    }
    func pushToSaved(vc: UIViewController){
        print(1)
        //        let sb = UIStoryboard(name: "Home", bundle: nil)
        //        let HomestaySearch = sb.instantiateViewController(withIdentifier: "HomestaySearchVC") as! HomestaySearchVC
        //        vc.navigationController?.pushViewController(HomestaySearch, animated: true)
    }
    func pushToBooking(vc: UIViewController){
        print(1)
        //        let sb = UIStoryboard(name: "Home", bundle: nil)
        //        let HomestaySearch = sb.instantiateViewController(withIdentifier: "HomestaySearchVC") as! HomestaySearchVC
        //        vc.navigationController?.pushViewController(HomestaySearch, animated: true)
    }
    func pushToSetting(vc: UIViewController){
        print(1)
        //        let sb = UIStoryboard(name: "Home", bundle: nil)
        //        let HomestaySearch = sb.instantiateViewController(withIdentifier: "HomestaySearchVC") as! HomestaySearchVC
        //        vc.navigationController?.pushViewController(HomestaySearch, animated: true)
    }
}