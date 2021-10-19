//
//  odaViewModel.swift
//  oda
//
//  Created by Stine Marie Vørner on 14/10/2021.
//

import Foundation
import SwiftUI

class odaViewModel: ObservableObject{
        
    var model: OdaModel = OdaModel()
    var dataService: DataService = DataService()

    @Published var itemsInBasket = 0
    @Published var costOfBasket = 0.00
    @Published var liveUpdatedCount: [Int] = []
    
//calls on passURL() to get ahold of Endpoints url
    init(){
        model.passURL()
    }

//function called through button OnClick in V. Sends parameters p(product.id) and g(product.gross_price) to M
//calls on getCount() + updateLive()
    func intentAddToBasket(p: Int, g: String){
        model.addToBasket(p: p, g: g)
        getCount()
        updateLive()
    }
    
//function called through button OnClick in V. Sends parameters p(product.id) and g(product.gross_price) to M
//calls on getCount() + updateLive()
    func intentRemoveFromBasket(p: Int, g: String){
        model.removeFromBasket(p: p, g: g)
        getCount()
        updateLive()
    }
    
//gets count of how many products in [historyBasket]
    func getCount(){
        var length = 0
        for _ in self.model.historyBasket {
            length += 1
        }
        itemsInBasket = length
    }

//translates string of product.gross_price to Double, calculates sum according to product added to basket
    func getTotalSum(){
        var sum = 0.00
        for money in self.model.basketTotal{
            let a: Double? = Double(money)
            let roundedA = round(a! * 10) / 10.0
            sum += roundedA
        }
        costOfBasket = sum
    }

//UserDefaults array liveItemCount from M sent through VM to be used in V
    func updateLive(){
        self.liveUpdatedCount = self.model.liveItemCount
    }

}


