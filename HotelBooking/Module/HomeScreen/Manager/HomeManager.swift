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
    var searchCategory: searchType?
    var saved: [HotelSearchItem] = []
    var booking: [OrderDetailModel] = []
    func pushToSearch(vc: UIViewController){
        print(1)
        let sb = UIStoryboard(name: "Search", bundle: nil)
        let hotelSearch = sb.instantiateViewController(withIdentifier: "HotelCustomVC") as! HotelCustomVC
        
        vc.navigationController?.pushViewController(hotelSearch, animated: true)
    }
    
    func pushToHome(vc: UIViewController){
        print(1)
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let HomestaySearch = sb.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        let navCon = UINavigationController(rootViewController: vc)
        navCon.pushViewController(HomestaySearch, animated: true)
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
    
    func makeShadow(view: UIView){
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 4
    }
}
