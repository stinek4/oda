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
   // @Published var liveItem = 0
    @Published var liveUpdatedCount: [Int] = []
    
    //calls on passURL() to get ahold of Endpoints url
    init(){
        model.passURL()
    }

    func intentAddToBasket(p: Int, g: String){

        model.addToBasket(p: p, g: g)
        getCount()
        updateLive()
    }
    
    func intentRemoveFromBasket(p: Int, g: String){
        model.removeFromBasket(p: p, g: g)
        getCount()
        updateLive()
    }
    
    func getCount(){
        var length = 0
        
        for _ in self.model.historyBasket {
            length += 1
        }
        itemsInBasket = length
    }
    
    func updateLive(){

        self.liveUpdatedCount = self.model.liveItemCount
    
    }
    
    func getTotalSum(){
        var sum = 0.00
        
        for money in self.model.basketTotal{
            let a: Double? = Double(money)
            
            let roundedA = round(a! * 10) / 10.0
            
            sum += roundedA
            
        }
        costOfBasket = sum
    }

    }


