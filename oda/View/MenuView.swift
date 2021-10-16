//
//  MenuView.swift
//  oda
//
//  Created by Stine Marie Vørner on 15/10/2021.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct MenuView: View{
    
    @ObservedObject var viewModel: odaViewModel = odaViewModel()
    @State private var product = [Product]()
    
    var body: some View{
        
        VStack{
            List(product, id: \.id){ item in
                HStack{
                    Text(item.name)
//                WebImage(url: URL(string: ""))
//                Text("product: \(itemList)")
            }
        }
               
        }
    }
}
