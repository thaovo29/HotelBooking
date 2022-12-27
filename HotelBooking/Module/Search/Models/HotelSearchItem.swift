//
//  HotelSearchItem.swift
//  HotelBooking
//
//  Created by MacOS on 21/12/2022.
//

import Foundation
import SwiftyJSON
struct HotelSearchItem :Codable {
    var id: Int
    var name: String
    var rate: Int
    var address: String
    var description: String
    var imageURL : String
    var facilities: [Facility]
    var longitude: Float
    var latitude: Float
    var room: [RoomItem]
    var isSaved: Bool = false
    
    init(json: JSON){
        id = json["id"].intValue
        name = json["name"].stringValue
        rate = json["rate"].intValue
        description = json["description"].stringValue
        address = json["address"].stringValue
        imageURL = json["imageURL"].stringValue
        var tempFacilites : [Facility] = []
        for item in json["facilities"].arrayValue {
            tempFacilites.append(Facility(json: item))
        }
        facilities = tempFacilites
        longitude = json["longitude"].floatValue
        latitude = json["latitude"].floatValue
        var tempRoom : [RoomItem] = []
        for item in json["room"].arrayValue {
            tempRoom.append(RoomItem(json: item))
        }
        room = tempRoom
    }
    static func parseDataHotelList(arrJS: [JSON]) -> [HotelSearchItem]{
        var arr: [HotelSearchItem] = []
        arr.append(contentsOf: arrJS.map({ js in
            return HotelSearchItem(json: js)
        }))
        return arr
    }

    init(){
        id = 0
        name = ""
        rate = 0
        description = ""
        address = ""
        imageURL = ""
        facilities = []
        longitude = 0
        latitude = 0
        room = []
    }
}


struct Facility : Codable{
    var id: Int
    var name: String
    var iconURL: String
    
    init(json: JSON){
        id = json["id"].intValue
        name = json["name"].stringValue
        iconURL = json["iconURL"].stringValue
    }
    static func parseDataFacility(arrJS: [JSON]) -> [Facility]{
        var arr: [Facility] = []
        arr.append(contentsOf: arrJS.map({ js in
            return Facility(json: js)
        }))
        return arr
    }
}

struct RoomItem : Codable{
    var id: Int
    var roomName: String
    var price: Int
    var area: Int
    var bed: String
    var adult: String
    var child: String
    var status: String
    var imageURL: String
    
    init(json: JSON){
        id = json["id"].intValue
        roomName = json["roomName"].stringValue
        price = json["price"].intValue
        area = json["area"].intValue
        bed = json["bed"].stringValue
        adult = json["adult"].stringValue
        child = json["child"].stringValue
        status = json["status"].stringValue
        imageURL = json["imageURL"].stringValue
    }
    
    init(){
        id = 0
        roomName = ""
        price = 0
        area = 0
        bed = ""
        adult = ""
        child = ""
        status = ""
        imageURL = ""
    }
    static func parseDataRoom(arrJS: [JSON]) -> [RoomItem]{
        var arr: [RoomItem] = []
        arr.append(contentsOf: arrJS.map({ js in
            return RoomItem(json: js)
        }))
        return arr
    }
}
