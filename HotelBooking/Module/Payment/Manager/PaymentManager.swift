//
//  PaymentManager.swift
//  HotelBooking
//
//  Created by MacOS on 22/12/2022.
//

import Foundation

class PaymentManager{
    
    public static var shared = PaymentManager()
    
    func changeDateToEEEDDMMM(day: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM" // OR "dd-MM-yyyy"

        let currentDateString: String = dateFormatter.string(from: day)
        return currentDateString
    }
}
