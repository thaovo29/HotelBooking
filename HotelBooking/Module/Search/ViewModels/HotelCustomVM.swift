//
//  HomeCustomVM.swift
//  HotelBooking
//
//  Created by MacOS on 20/12/2022.
//

import Foundation
import UIKit

class HotelCustomVM {
    var places: String?
    var callBackUpdateHeadCount : ((Int, Int, Int) -> Void)?
    var callBackHaventInputPlace : (() -> Void)?
    var orderDetail: OrderDetailModel?
    func setup(){
        orderDetail = OrderDetailModel()
    }
    
    func setMember(adult:Int, room: Int, child: Int){
        self.orderDetail?.adultNo = adult
        self.orderDetail?.roomNo = room
        self.orderDetail?.childNo = child
    }
    
    func presentSelectNumber(vc: UIViewController){
        SearchManager.shared.presentSelectNumberOfMember(vc: vc, room: self.orderDetail?.roomNo ?? 1, adults: self.orderDetail?.adultNo ?? 1, children: self.orderDetail?.childNo ?? 0) {[weak self] room, adult, child in
            DispatchQueue.main.async { [weak self] in
                self?.orderDetail?.adultNo = adult
                self?.orderDetail?.roomNo = room
                self?.orderDetail?.childNo = child
                self?.callBackUpdateHeadCount?(room, adult, child)
            }
        }
    }

    
    func pushToHotelSearch(vc: UIViewController){
//        guard let places = places else {
//            self.callBackHaventInputPlace?()
//            return
//        }
        guard let orderDetail = orderDetail else {return}
        SearchManager.shared.pushToHotelSearch(vc: vc, place: places ?? "", orderDetail: orderDetail)
    }
}
