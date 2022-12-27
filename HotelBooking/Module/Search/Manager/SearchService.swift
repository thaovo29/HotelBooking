//
//  SearchService.swift
//  HotelBooking
//
//  Created by MacOS on 21/12/2022.
//

import Foundation
import Alamofire
import SwiftyJSON
class SearchService{
    public static var shared = SearchService()
    
    func getHotelItemData(callBack: @escaping(([HotelSearchItem]) -> ())){
        
        let url = getSearchType()
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { response in
            switch (response.result)
            {
            case .success(_):
                if let jsonData = response.data{
                    let data = JSON(jsonData)
                    callBack(HotelSearchItem.parseDataHotelList(arrJS: data.array ?? []))
                }
            case .failure(let error):
                print(error)
            }
          }
    }
    
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
    
    func getSearchType() -> String{
        guard let type = HomeManager.shared.searchCategory else {return ""}
        switch type{
        case .Hotel:
            return "http://52.36.5.201/getHotelList"
        case .Homestay:
            return "http://52.36.5.201/getHomestayList"
        case .Resort:
            return "http://52.36.5.201/getResortList"
        case .Apartment:
            return "http://52.36.5.201/getApartmentList"
        }
    }
}
