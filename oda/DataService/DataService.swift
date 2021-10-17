//
//  DataService.swift
//  oda
//
//  Created by Stine Marie Vørner on 16/10/2021.
//

import Foundation
import SwiftUI

class DataService: ObservableObject{
    
    var model: OdaModel = OdaModel()

    @Published var items : [Item] = []
    @Published var products : [Product] = []
    

//    @State var id : Int = 123
//    @State var name: String = "Haggis"
    

    
//    func pushProducts(){
//        let product = Product.self
//        var products = []
//        products.append(product)
//        print(products)
//    }
    
    init(){
        getProducts()
    }
    
    func getProducts(){
        
        
        guard let url = URL(string: "\(model.currentUrl)") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let session = URLSession.shared
        session.dataTask(with: request){ data, response, error in
            if let error = error {
                print(error)
                return
            }

            guard let data = data else {
                return
            }

            do {
                let jsonData = try JSONDecoder().decode(OdaData.self, from: data)
                DispatchQueue.main.async {[weak self] in
                    self?.items = jsonData.items
                    print(jsonData.items)
                    
                    self?.products = jsonData.items.map{ item in
                        item.product
                    }
                }
               
            } catch{
                print(error)
            }
        }.resume()
    
    }
}
