//
//  odaViewModel.swift
//  oda
//
//  Created by Stine Marie Vørner on 14/10/2021.
//

import Foundation
import UIKit
import SwiftUI

class odaViewModel: ObservableObject{
    
    @Published var id: Int = 123
    @Published var name: String = "Tomato"
    @Published var images: Array = []
    @Published var thumbnail: String = "url"
    @Published var large: String = "url"
    @Published var gross_price: Int = 123
    @Published var gross_unit_price: Int = 123
    @Published var products: Array = []
    
    
    var model: OdaModel = OdaModel()
    
    //Initializes url for loadData() to actually have content
    //calls on passURL() to get ahold of Endpoints url
    init(){
        loadData(url: model.currentUrl)
        model.passURL()
    }
    
    func loadData(url: String){
        URLSession.shared.dataTask(with: URL(string: url)!){ data, response, error in
            if let data = data {
            let parsedProductData = try? JSONDecoder().decode(Product.self, from: data)
                DispatchQueue.main.async { [weak self] in
                    self?.id = parsedProductData!.id
                    self?.name = parsedProductData!.name
                    self?.images = parsedProductData!.images
                    self?.gross_price = parsedProductData!.gross_price
                    self?.gross_unit_price = parsedProductData!.gross_unit_price
                }
            }
            
        }.resume()
    }
}


//                let parsedOdaData = try? JSONDecoder().decode(OdaData.self, from: data)
//                DispatchQueue.main.async { [weak self] in
//                    self?.products = parsedOdaData!.products
////                    self?.id = parsedOdaData!.id
////                    self?.name = parsedOdaData!.name
////                    self?.images = parsedOdaData!.images
////                    self?.gross_price = parsedOdaData!.gross_price
////                    self?.gross_unit_price = parsedOdaData!.gross_unit_price
//
//
