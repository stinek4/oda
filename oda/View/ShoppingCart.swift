//
//  ShoppingCart.swift
//  oda
//
//  Created by Stine Marie Vørner on 15/12/2021.
//

import Foundation
import SwiftUI

struct ShoppingCart: View{
    
    @ObservedObject var viewModel: odaViewModel = odaViewModel()
    @ObservedObject var dataService: DataService = DataService()

    var body: some View{
                
        VStack(){
            if viewModel.itemsInBasket > 0 {
                HStack(){
                    Image(systemName: "cart")
                        .resizable().frame(width: 24, height: 24, alignment: .leading)
                    Text("\(viewModel.itemsInBasket) products")
                        .foregroundColor(Color(Constants.Color.primaryTextColor))
                        .font(Font.custom(Constants.Font.rubikRegular, size: 14))
                    Spacer()
                    Text("\(viewModel.costOfBasket, specifier: "%.2f")kr")
                        .foregroundColor(Color(Constants.Color.primaryTextColor))
                        .font(Font.custom(Constants.Font.rubikRegular, size: 14))
                }
                .padding(.leading)
                .padding(.trailing)
            }
        }
    }
}
