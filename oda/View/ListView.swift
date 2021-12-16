//
//  ListView.swift
//  oda
//
//  Created by Stine Marie Vørner on 18/10/2021.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct ListView: View{
    
    @ObservedObject var viewModel: odaViewModel = odaViewModel()
    @ObservedObject var dataService: DataService = DataService()
    
    init(){
        viewModel.getTotalSum()
    }
    
    var body: some View{


        let basket = viewModel.liveUpdatedCount
        
        VStack(){
            VStack{
//MARK: Header
                Text("Shopping Cart")
                    .font(Font.custom(Constants.Font.rubikRegular, size: 20).bold())
                    .accessibilityAddTraits(.isHeader)
                
                ScrollView{
                    ForEach(dataService.products){ product in
                        HStack(){
                            let filteredBasket = basket.filter{ i in
                                return i == product.id
                                
                            }
                            let basketCount = filteredBasket.count
                            let isAvailable = product.availability.is_available || false
                            let isDiscounted = product.discount?.is_discounted ?? true
                            
//MARK: ListView
                            ZStack{
                                WebImage(url: URL(string: product.images[0].thumbnail.url))
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.trailing, 2)
                            }.frame(width: 56, height: 56, alignment: .center)
                            
                            VStack(alignment: .leading){
                                Text(product.name)
                                    .foregroundColor(Color(Constants.Color.primaryTextColor))
                                    .multilineTextAlignment(.leading)
                                    .font(Font.custom(Constants.Font.rubikRegular, size: 14))
                                    .font(Font.title.weight(.bold))
                                if isAvailable == true{
                                Text(product.name_extra)
                                    .foregroundColor(Color(Constants.Color.secondaryTextColor))
                                    .multilineTextAlignment(.leading)
                                    .font(Font.custom(Constants.Font.rubikRegular, size: 14))
                                }else{
                                    Text("Out of stock")
                                        .foregroundColor(Color(Constants.Color.ooSColor))
                                        .multilineTextAlignment(.leading)
                                        .font(Font.custom(Constants.Font.rubikRegular, size: 14))
                                }
                            }
                            Spacer()
                            VStack{
                                if (basketCount == 0){
                                    Text(product.gross_price + " kr")
                                        .foregroundColor(Color(Constants.Color.primaryTextColor))
                                        .multilineTextAlignment(.trailing)
                                        .font(Font.custom(Constants.Font.rubikRegular, size: 14))
                                    Text("kr " + product.gross_unit_price + "/" + product.unit_price_quantity_abbreviation)
                                        .foregroundColor(Color(Constants.Color.secondaryTextColor))
                                        .multilineTextAlignment(.trailing)
                                        .font(Font.custom(Constants.Font.rubikRegular, size: 12))
//                                }else{
//                                    Text("kr " + product.gross_unit_price + "/" + product.unit_price_quantity_abbreviation)
//                                       .foregroundColor(Color(Constants.Color.accentColor))
//                                       .multilineTextAlignment(.trailing)
//                                       .font(Font.custom(Constants.Font.rubikRegular, size: 12))
//                                   Text("kr " + product.discount?.undiscounted_gross_price)
//                                       .foregroundColor(Color(Constants.Color.secondaryTextColor))
//                                       .multilineTextAlignment(.trailing)
//                                       .font(Font.custom(Constants.Font.rubikRegular, size: 12))
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
                                        Image(systemName: Constants.Icons.whiteMinusIcon)
                                            .resizable().frame(width: 32, height: 32, alignment: .leading)
                                            .foregroundColor(Color(Constants.Color.secondaryTextColor))
                                    }
                                    Text("\(basketCount)")
                                        .font(Font.custom(Constants.Font.rubikRegular, size: 16))
                                        .padding(.bottom, 5)
                                }
                                Button{
                                    viewModel.intentAddToBasket(
                                        p: product.id,
                                        g: product.gross_price)
                                    viewModel.getTotalSum()
                                        
                                }label:{
                                    if isAvailable == true{
                                        Image(systemName: Constants.Icons.plusIcon)
                                            .resizable().frame(width: 32, height: 32, alignment: .leading)
                                            .foregroundColor(Color(Constants.Color.accentColor))
                                    }else{
                                        Image(systemName: Constants.Icons.whitePlusIcon)
                                            .resizable().frame(width: 32, height: 32, alignment: .leading)
                                            .foregroundColor(Color(Constants.Color.secondaryTextColor))
                                    }
                                }.disabled(isAvailable == false)
                            }
                        
                        Divider()
                    }
                }
                .padding()
            }
            
//MARK: Shoppingcart
            ShoppingCart()
        }
    }
}

}
