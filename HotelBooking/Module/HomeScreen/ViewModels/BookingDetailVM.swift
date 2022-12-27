//
//  BookingDetailVM.swift
//  HotelBooking
//
//  Created by MacOS on 23/12/2022.
//

import Foundation
import UIKit

class BookingDetailVM{
    var orderDetail: OrderDetailModel?
    
    func bindData(data: OrderDetailModel?)
    {
        orderDetail = data
    }
    
    
}
