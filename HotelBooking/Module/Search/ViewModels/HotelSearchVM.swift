//
//  HotelSearchVM.swift
//  HotelBooking
//
//  Created by MacOS on 21/12/2022.
//

import Foundation
import UIKit
class HotelSearchVM {
    var hotelItemsModel : [HotelSearchItem] = []
    var callbackReloadData : (() -> Void)?
    var orderDetail: OrderDetailModel?
    var place: String?
    func getHotelData(){
        SearchService.shared.getHotelItemData { [weak self] data in
            self?.hotelItemsModel = data
            DispatchQueue.main.async {
                self?.callbackReloadData?()
            }
        }
    }
    
    func pushToSeeDetail(vc: UIViewController, model: Int){
        if model < hotelItemsModel.count {
            orderDetail?.hotel = hotelItemsModel[model]
            guard let order = orderDetail else {return}
            SearchManager.shared.pushToHotelDetail(vc: vc, orderDetail: order)
        }
    }
    
    func bindData(orderDetail: OrderDetailModel?, place: String?){
        self.orderDetail = orderDetail
        self.place = place
    }
}
