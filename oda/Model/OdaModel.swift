//
//  odaModel.swift
//  oda
//
//  Created by Stine Marie Vørner on 14/10/2021.
//

import Foundation

struct OdaModel{
    
    var currentUrl: String = EndPoint.hostJSON
    
    var historyBasket: [Int] = []
    var basketTotal: [String] = []
    var liveItemCount: [Int] = []
   


    init(){
        if let storedArray = UserDefaults.standard.array(forKey: "history") as? [Int]{
            historyBasket = storedArray
        } else {
            historyBasket = []
        }
        
        if let storedTotal = UserDefaults.standard.array(forKey: "total") as? [String]{
            basketTotal = storedTotal
        } else {
            basketTotal = []
        }
        
        if let storedCount = UserDefaults.standard.array(forKey: "count") as? [Int]{
            liveItemCount = storedCount
        } else {
            liveItemCount = []
        }
        
    }

    mutating func addToBasket(p: Int, g: String){
        historyBasket.append(p)
        basketTotal.append(g)
        liveItemCount.append(p)
    
    }
    
    mutating func removeFromBasket(p: Int, g: String){
        if let index = historyBasket.firstIndex(of: p){
            historyBasket.remove(at: index)
            liveItemCount.remove(at: index)
        }
        if let moneyIndex = basketTotal.firstIndex(of: g){
            basketTotal.remove(at: moneyIndex)
        }
    }

    //Passes URL from Endpoint through Model to ViewModel
    mutating func passURL(){
        currentUrl = EndPoint.hostJSON
    }
    

}
