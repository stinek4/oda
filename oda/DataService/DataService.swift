//
//  DataService.swift
//  oda
//
//  Created by Stine Marie Vørner on 16/10/2021.
//

import Foundation
import SwiftUI

class DataService: ObservableObject{
    
//These arrays are set with JSON throug OdaData, now able to use in V.
    @Published var items : [Item] = []
    @Published var products : [Product] = []
    
    
//Initializes JSONdecoder right away
    init(){
        getProducts()
    }
    
//Decodes JSON from EndPoint
//Sets jsonData through OdaData to be @Published var Arrays at the top of this file.
    func getProducts(){
        guard let url = URL(string: "\(EndPoint.hostJSON)") else { return }

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
