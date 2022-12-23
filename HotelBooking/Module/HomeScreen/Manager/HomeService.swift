//
//  HomeService.swift
//  HotelBooking
//
//  Created by MacOS on 19/12/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
class HomeService{
    public static var shared = HomeService()
    
    func getDiscoverMoreData(callBack: @escaping(([DiscoverMoreModel]) -> ())){
        let url = "http://52.36.5.201/getDiscoverList"
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { response in
            switch (response.result)
            {
            case .success(_):
                if let jsonData = response.data{
                    let data = JSON(jsonData)
                    callBack(DiscoverMoreModel.parseDataDiscoverMore(arrJS: data.array ?? []))
                }
            case .failure(let error):
                print(error)
            }
          }
    }
}
