//
//  DicoverMoreModel.swift
//  HotelBooking
//
//  Created by MacOS on 19/12/2022.
//

import Foundation
import SwiftyJSON
struct DiscoverMoreModel: Codable{
    var id: Int
    var image: String
    var link: String
    
    init(json: JSON){
        id = json["id"].intValue
        image = json["image"].stringValue
        link = json["link"].stringValue
    }
    static func parseDataDiscoverMore(arrJS: [JSON]) -> [DiscoverMoreModel]{
        var arr: [DiscoverMoreModel] = []
        arr.append(contentsOf: arrJS.map({ js in
            return DiscoverMoreModel(json: js)
        }))
        return arr
    }
}
