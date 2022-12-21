//
//  SearchManager.swift
//  HotelBooking
//
//  Created by MacOS on 20/12/2022.
//

import Foundation
import UIKit

class SearchManager {
    public static var shared = SearchManager()
    private var kSearch = "Search"
    
    func presentSelectNumberOfMember(vc: UIViewController,room: Int, adults: Int, children: Int,  callback: ((Int, Int, Int) -> Void)?){
        let sb = UIStoryboard(name: kSearch, bundle: nil)
        let newvc = sb.instantiateViewController(withIdentifier: "NumberOfMemberViewController") as! NumberOfMemberViewController
        newvc.bindData(room: room, adult: adults, children: children)
        newvc.callBack = { room, adult, children in
            callback?(room, adult, children)
        }
        vc.present(newvc, animated: true)
    }
    func pushToHotelSearch(vc: UIViewController, place: String){
        let newvc = UIStoryboard(name: kSearch, bundle: nil).instantiateViewController(withIdentifier: "HotelSearchVC") as! HotelSearchVC
        newvc.place = place
        vc.navigationController?.pushViewController(newvc, animated: true)
    }
}
