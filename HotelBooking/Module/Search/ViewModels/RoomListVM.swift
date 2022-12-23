//
//  RoomListVM.swift
//  HotelBooking
//
//  Created by MacOS on 22/12/2022.
//

import Foundation
import UIKit

class RoomListVM {
    var orderDetail : OrderDetailModel?
    
    func bindData(orderDetail: OrderDetailModel?){
        self.orderDetail = orderDetail
    }
    
    func getRoomAt(index: Int) -> RoomItem?{
        return orderDetail?.hotel.room[index] 
    }
    func pushToPaymentDetail(vc: UIViewController, index: Int){
        if index < orderDetail?.hotel.room.count ?? 0 {
            if let room = orderDetail?.hotel.room[index] {
                orderDetail?.room = room
                guard let orderDetail = orderDetail else {return}
                SearchManager.shared.pushToPaymentDetail(vc: vc, orderDetail: orderDetail)
            }
        }
    }
}
