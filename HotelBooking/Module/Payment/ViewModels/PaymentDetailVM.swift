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
    
    func checkInformation () -> Bool {
        if orderDetail?.customerPhone == "" || orderDetail?.customerName == "" || orderDetail?.customerEmail == ""{
            return false
        }
        if orderDetail?.paymentMethod == "Visa"{
            if orderDetail?.CVV == "" || orderDetail?.cardOwner == "" || orderDetail?.cardNumber == "" || orderDetail?.cardExpireDate == "" {
                return false
            }
        }
        return true
    }
}
