//
//  HomeCustomVM.swift
//  HotelBooking
//
//  Created by MacOS on 20/12/2022.
//

import Foundation
import UIKit

class HotelCustomVM {
    var adultNo: Int?
    var childNo: Int?
    var roomNo: Int?
    var places: String?
    var dateCheckIn: Date?
    var dateCheckOut: Date?
    var callBackUpdateHeadCount : ((Int, Int, Int) -> Void)?
    var callBackHaventInputPlace : (() -> Void)?
    func setup(){
        if adultNo == nil {
            adultNo = 1
        }
        if childNo == nil {childNo = 0}
        if roomNo == nil {roomNo = 1}
        if dateCheckIn == nil {dateCheckIn = Date()}
        if dateCheckOut == nil {dateCheckOut = Calendar.current.date(byAdding: .day, value: 1, to: Date()) }
    }
    
    func setMember(adult:Int, room: Int, child: Int){
        self.adultNo = adult
        self.roomNo = room
        self.childNo = child
    }
    
    func presentSelectNumber(vc: UIViewController){
        SearchManager.shared.presentSelectNumberOfMember(vc: vc, room: self.roomNo ?? 1, adults: self.adultNo ?? 1, children: self.childNo ?? 0) {[weak self] room, adult, child in
            DispatchQueue.main.async { [weak self] in
                self?.adultNo = adult
                self?.roomNo = room
                self?.childNo = child
                self?.callBackUpdateHeadCount?(room, adult, child)
            }
        }
    }

    
    func pushToHotelSearch(vc: UIViewController){
        guard let places = places else {
            self.callBackHaventInputPlace?()
            return
        }
        SearchManager.shared.pushToHotelSearch(vc: vc, place: places)
    }
}
