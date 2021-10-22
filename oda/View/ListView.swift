//
//  ListView.swift
//  oda
//
//  Created by Stine Marie Vørner on 18/10/2021.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI
import UIKit

struct ListView: View{
    
    @ObservedObject var viewModel: odaViewModel = odaViewModel()
    @ObservedObject var dataService: DataService = DataService()
    
    var body: some View{
        

        let basket = viewModel.liveUpdatedCount
        
        VStack(){
            VStack{
//MARK: Header
                Text("Shopping Cart")
                    .font(.system(size: 20).bold())
                    .accessibilityAddTraits(.isHeader)
                
                ScrollView{
                    ForEach(dataService.products){ product in
                        HStack(){
                            let filteredBasket = basket.filter{ i in
                                return i == product.id
                                
                            }
                            let basketCount = filteredBasket.count
//MARK: ListView
                            ZStack{
                                WebImage(url: URL(string: product.images[0].thumbnail.url))
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.trailing, 2)
                            }.frame(width: 56, height: 56, alignment: .center)
                            
                            VStack(alignment: .leading){
                                Text(product.name)
                                    .foregroundColor(Color("PrimaryTextColor"))
                                    .multilineTextAlignment(.leading)
                                    .font(Font.custom("Rubik", size: 14))
                                    .font(Font.title.weight(.bold))
                                Text(product.name_extra)
                                    .foregroundColor(Color("SecondaryTextColor"))
                                    .multilineTextAlignment(.leading)
                                    .font(Font.custom("Rubik", size: 14))
                            }
                            Spacer()
                            VStack{
                                if basketCount == 0 {
                                    Text(product.gross_price)
                                        .foregroundColor(Color("PrimaryTextColor"))
                                        .multilineTextAlignment(.trailing)
                                        .font(Font.custom("Rubik", size: 14))
                                    Text(product.gross_unit_price)
                                        .foregroundColor(Color("SecondaryTextColor"))
                                        .multilineTextAlignment(.trailing)
                                        .font(Font.custom("Rubik", size: 14))
                                }
                            }
                            
//MARK: Buttons
                            HStack(alignment: .bottom){
                                if basketCount > 0 {
                                    Button{
                                        viewModel.intentRemoveFromBasket(
                                            p: product.id,
                                            g: product.gross_price)
                                        viewModel.getTotalSum()
                                    }label:{
                                        Image(systemName: "minus.circle.fill")
                                            .resizable().frame(width: 32, height: 32, alignment: .leading)
                                    }
                                    Text("\(basketCount)")
                                }
                                Button{
                                    viewModel.intentAddToBasket(
                                        p: product.id,
                                        g: product.gross_price)
                                    viewModel.getTotalSum()
                                }label:{
                                     Image(systemName: "plus.circle.fill")
                                .resizable().frame(width: 32, height: 32, alignment: .leading)
                                .font(Font.title.weight(.light))
                                }
                            }
                        }
                        Divider()
                    }
                }
                .padding()
            }

//MARK: Shopping Cart Panel
            
        if viewModel.itemsInBasket > 0 {
            HStack(){
                Image(systemName: "cart")
                    .resizable().frame(width: 24, height: 24, alignment: .leading)
                Text("\(viewModel.itemsInBasket) products")
                    .foregroundColor(Color("PrimaryTextColor"))
                    .font(Font.custom("Rubik", size: 14))
                Spacer()
                Text("\(viewModel.costOfBasket, specifier: "%.2f")kr")
                    .foregroundColor(Color("PrimaryTextColor"))
                    .font(Font.custom("Rubik", size: 14))
            }
            .padding(.leading)
            .padding(.trailing)
        }
        }
    }
}
