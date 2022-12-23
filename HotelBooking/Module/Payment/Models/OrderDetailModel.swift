//
//  OrderDetailModel.swift
//  HotelBooking
//
//  Created by MacOS on 22/12/2022.
//

import Foundation

struct OrderDetailModel {
    var adultNo: Int
    var childNo: Int
    var roomNo: Int
    var hotel: HotelSearchItem
    var room: RoomItem
    var customerName: String
    var customerPhone: String
    var customerEmail: String
    var paymentMethod: String
    var cardOwner: String
    var cardNumber: String
    var CVV: String
    var cardExpireDate: String
    var checkInDay: Date
    var checkOutDay: Date
    
    init(adultNo: Int? = nil, childNo: Int? = nil, roomNo: Int? = nil, hotel: HotelSearchItem? = nil, room: RoomItem? = nil, customerName: String? = nil, customerPhone: String? = nil, customerEmail: String? = nil, paymentMethod: String? = nil, cardOwner: String? = nil, cardNumber: String? = nil, CVV: String? = nil, cardExpireDate: String? = nil, checkInDay: Date? = nil, checkOutDay: Date? = nil) {
        self.adultNo = adultNo ?? 1
        self.childNo = childNo ?? 0
        self.roomNo = roomNo ?? 1
        self.hotel = hotel ?? HotelSearchItem()
        self.room = room ?? RoomItem()
        self.customerName = customerName ?? ""
        self.customerPhone = customerPhone ?? ""
        self.customerEmail = customerEmail ?? ""
        self.paymentMethod = paymentMethod ?? ""
        self.cardOwner = cardOwner ?? ""
        self.cardNumber = cardNumber ?? ""
        self.CVV = CVV ?? ""
        self.cardExpireDate = cardExpireDate ?? ""
        self.checkInDay = checkInDay ?? Date()
        self.checkOutDay = checkOutDay ?? Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    }
}
