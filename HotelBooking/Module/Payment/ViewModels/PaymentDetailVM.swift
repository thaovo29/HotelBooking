//
//  PaymentDetailVM.swift
//  HotelBooking
//
//  Created by MacOS on 22/12/2022.
//

import Foundation

class PaymentDetailVM {
    var orderDetail: OrderDetailModel?
    func bindData(orderDetail: OrderDetailModel?){
        self.orderDetail = orderDetail
    }
}
