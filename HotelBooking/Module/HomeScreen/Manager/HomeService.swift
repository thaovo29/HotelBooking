//
//  HomeService.swift
//  HotelBooking
//
//  Created by MacOS on 19/12/2022.
//

import Foundation

class HomeService{
    public static var shared = HomeService()
    
    func getDiscoverMoreData(callBack: (([DiscoverMoreModel]) -> Void)?){
        
        let url = URL(string: "http://52.36.5.201/getDiscoverList")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {return}
            do{
                let user = try JSONDecoder().decode([DiscoverMoreModel].self, from: data)
                callBack?(user)
            }
            catch {
                print(error)
            }
            
        }
        task.resume()
    }
}
