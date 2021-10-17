//
//  odaViewModel.swift
//  oda
//
//  Created by Stine Marie Vørner on 14/10/2021.
//

import Foundation

class odaViewModel: ObservableObject{
    
    
    //var items: [] = DataService
//    @Published var id: Int =
    @Published var name: String = ""
    @Published var thumbnail: String = "url"
    @Published var large: String = "url"
    @Published var gross_price: Int = 123
    @Published var gross_unit_price: Int = 123
    
//    @Published var product: Array = []
    
    
    var model: OdaModel = OdaModel()
    var dataService: DataService = DataService()
    
    
    
    //Initializes url for loadData() to actually have content
    //calls on passURL() to get ahold of Endpoints url
    init(){
        model.passURL()
        getIDs()

    }

//    func allProductsIntoList(list: [Product]) -> [Product]{
//        dataService.productList.append(dataService.product)
//        return productsInList
//    }
//
    
    func getIDs(){
        let productIDs = dataService.items.map(\.product)
        print(productIDs)
    }
}
