//
//  HomeVM.swift
//  HotelBooking
//
//  Created by MacOS on 19/12/2022.
//

import Foundation
class HomeVM{
    var discoverMoreModels : [DiscoverMoreModel] = []
    var callbackReloadData : (() -> Void)?
    func getDiscoverData(){
        HomeService.shared.getDiscoverMoreData { [weak self] data in
            self?.discoverMoreModels = data
            DispatchQueue.main.async {
                self?.callbackReloadData?()
            }
        }
    }
}
