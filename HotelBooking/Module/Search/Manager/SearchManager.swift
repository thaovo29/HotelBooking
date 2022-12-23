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
    public static var orderDetail : OrderDetailModel?
    func presentSelectNumberOfMember(vc: UIViewController,room: Int, adults: Int, children: Int,  callback: ((Int, Int, Int) -> Void)?){
        let sb = UIStoryboard(name: kSearch, bundle: nil)
        let newvc = sb.instantiateViewController(withIdentifier: "NumberOfMemberViewController") as! NumberOfMemberViewController
        newvc.bindData(room: room, adult: adults, children: children)
        newvc.callBack = { room, adult, children in
            callback?(room, adult, children)
        }
        vc.present(newvc, animated: true)
    }
    func pushToHotelSearch(vc: UIViewController, place: String, orderDetail: OrderDetailModel){
        let newvc = UIStoryboard(name: kSearch, bundle: nil).instantiateViewController(withIdentifier: "HotelSearchVC") as! HotelSearchVC
        newvc.place = place
        newvc.orderDetail = orderDetail
        vc.navigationController?.pushViewController(newvc, animated: true)
    }
    
    func pushToHotelDetail(vc: UIViewController, orderDetail: OrderDetailModel){
        let newvc = UIStoryboard(name: kSearch, bundle: nil).instantiateViewController(withIdentifier: "HotelDetailVC") as! HotelDetailVC
        newvc.orderDetail = orderDetail
        vc.navigationController?.pushViewController(newvc, animated: true)
    }
    
    func pushToRoomList(vc:UIViewController, orderDetail: OrderDetailModel){
        let newvc = UIStoryboard(name: kSearch, bundle: nil).instantiateViewController(withIdentifier: "RoomListVC") as! RoomListVC
        newvc.orderDetail = orderDetail
        vc.navigationController?.pushViewController(newvc, animated: true)
    }
    func pushToPaymentDetail(vc:UIViewController, orderDetail: OrderDetailModel) {
        let newvc = UIStoryboard(name: "Payment", bundle: nil).instantiateViewController(withIdentifier: "PaymentDetailVC") as! PaymentDetailVC
        newvc.orderDetail = orderDetail
        vc.navigationController?.pushViewController(newvc, animated: true)
    }
}
