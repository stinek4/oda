//
//  odaModel.swift
//  oda
//
//  Created by Stine Marie Vørner on 14/10/2021.
//

import Foundation

struct OdaModel{
    
    var currentUrl: String = EndPoint.hostJSON
    
    
//Passes URL from Endpoint through Model to ViewModel
    mutating func passURL(){
        currentUrl = EndPoint.hostJSON
    }
    
//UserDefaults Arrays
    var historyBasket: [Int] = []
    var basketTotal: [String] = []
    var liveItemCount: [Int] = []

    
//On init, three UserDefault Arrays are created.
//historyBasket for putting products through product.id in the basket
//basketTotal for calculating the sum total of the products in the basket
//liveItemCount for indicating how many of each product is in the basket
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
    
//addToBasket is called upon throuch intentAddToBasket in VM
//appending to array through parameter p(product.id) and g(product.gross_price from V
    mutating func addToBasket(p: Int, g: String){
        historyBasket.append(p)
        basketTotal.append(g)
        liveItemCount.append(p)
    }
    
    
//addToBasket is called upon throuch intentRemoveFromBasket in VM
//removing from array using parameter p(product.id) and g(product.gross_unit_price from V as index
    mutating func removeFromBasket(p: Int, g: String){
        if let index = historyBasket.firstIndex(of: p){
            historyBasket.remove(at: index)
            liveItemCount.remove(at: index)
        }
        if let moneyIndex = basketTotal.firstIndex(of: g){
            basketTotal.remove(at: moneyIndex)
        }
    }


}
