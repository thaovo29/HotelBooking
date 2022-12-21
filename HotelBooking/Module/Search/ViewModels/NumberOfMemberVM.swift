//
//  NumberOfMemberVM.swift
//  HotelBooking
//
//  Created by MacOS on 20/12/2022.
//

import Foundation
class NumberOfMemberVM{
    var adults : Int?
    var children: Int?
    var rooms: Int?
    
    func mapData(adults: Int?, children: Int?, room: Int?){
        self.adults = adults ?? 1
        self.children = children ?? 0
        self.rooms = room ?? 1
    }
    func inscreaseAdult() {
        guard let adults = adults else {
            self.adults = 1
            return
        }
        self.adults = adults + 1
    }
    
    func inscreaseChildren() {
        guard let children = children else {
            self.children = 0
            return
        }
        self.children = children + 1
    }
    
    func inscreaseRoom() {
        guard let rooms = rooms else {
            self.rooms = 1
            return
        }
        self.rooms = rooms + 1
    }
    
    func decreaseRoom() {
        guard let rooms = rooms else {
            self.rooms = 1
            return
        }
        if rooms > 1 {self.rooms = rooms - 1}
    }
    
    func decreaseAdult() {
        guard let adults = adults else {
            self.adults = 1
            return
        }
        if adults > 1 {self.adults = adults - 1}
    }
    
    func decreaseChildren() {
        guard let children = children else {
            self.children = 1
            return
        }
        if children > 0 {self.children =  children - 1}
    }
}
