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
    @ObservedObject var dataService: DataService = DataService()
    
   
    var body: some View{
        
        VStack(alignment: .leading){
            Text("Shoppingcart")
                .font(.system(size: 25))
            List(dataService.products){ product in

            HStack(){
                WebImage(url: URL(string: product.images[0].thumbnail.url))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .leading)
                    .padding(.leading, 2)
                    .padding(.trailing, 2)
                VStack(alignment: .leading){
                    Text(product.name)
                        .foregroundColor(Color("PrimaryTextColor"))
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 14))
                    Text(product.name_extra)
                        .foregroundColor(Color("SecondaryTextColor"))
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 14))
                }
            }.frame(minHeight: 0, maxHeight: .infinity)
                
                Button{
                
                }label:{
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.medium)
                }
            }
        }
   }
}

