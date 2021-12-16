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
      NavigationView{
        VStack(){
            VStack{
//MARK: Header
                Header()
                ScrollView{
                    ForEach(dataService.products){ product in
                        HStack(){
                            let filteredBasket = basket.filter{ i in
                                return i == product.id
                            }
                            let basketCount = filteredBasket.count
                            let isAvailable = product.availability.is_available || false
                            let isDiscounted = product.discount?.is_discounted ?? false
                            
//MARK: ListView
                            VStack{
                                NavigationLink(
                                    destination: ThumbnailView(product: product),
                                    label: {
                                        ZStack{
                                        WebImage(url: URL(string: product.images[0].thumbnail.url))
                                            .resizable()
                                            .scaledToFit()
                                            .padding(.trailing, 2)
                                            if isDiscounted{
                                                PromotionLabel(product: product)
                                                    .padding(.bottom, 30)
                                                    .padding(.trailing, 35)
                                            }
                                        }
                                    }
                                )
                            }.frame(width: 56, height: 56, alignment: .center)
                            VStack(alignment: .leading){
                                NameView(product: product)
                                NameExtraView(product: product)
                            }
                            Spacer()
                            VStack{
                                if (basketCount == 0 && !isDiscounted){
                                    PriceView(product: product)
                                }else if (basketCount == 0 && isDiscounted){
                                    PromotionPriceView(product: product)
                                }
                            }
//MARK: Buttons
                            HStack(alignment: .bottom){
                                if basketCount > 0 {
                                    Button{
                                        viewModel.intentRemoveFromBasket( p: product.id,g: product.gross_price)
                                        viewModel.getTotalSum()
                                    }label:{
                                        WhiteMinusButton()
                                    }
                                    Text("\(basketCount)")
                                        .font(Font.custom(Constants.Font.rubikRegular, size: 16))
                                        .padding(.bottom, 5)
                                }
                                Button{
                                    viewModel.intentAddToBasket(p: product.id, g: product.gross_price)
                                    viewModel.getTotalSum()
                                }label:{
                                    if (isAvailable == true && basketCount == 0){
                                        PlusButton()
                                    }else{
                                        WhitePlusButton()
                                    }
                                }.disabled(isAvailable == false)
                            }
                            Divider()
                        }
                    }.padding()
                }
//MARK: Shoppingcart
                ShoppingCart()
            }
        }
      }
    }
}
