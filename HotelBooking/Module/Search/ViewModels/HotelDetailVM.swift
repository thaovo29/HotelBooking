//
//  HotelDetailVM.swift
//  HotelBooking
//
//  Created by MacOS on 21/12/2022.
//

import Foundation
import UIKit
class HotelDetailVM {
    var orderDetail : OrderDetailModel?
    func bindData(orderDetail: OrderDetailModel?){
        self.orderDetail = orderDetail
    }
    
    func getHotelName() -> String{
        return orderDetail?.hotel.name ?? ""
    }
    
    func getPrice() -> Int{
        return orderDetail?.hotel.room.first?.price ?? 0
    }
    
    func pushToRoomList(vc: UIViewController){
        if let order = orderDetail {
            SearchManager.shared.pushToRoomList(vc: vc, orderDetail: order)
        }
    }
}
