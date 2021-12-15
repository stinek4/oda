//
//  Buttons.swift
//  oda
//
//  Created by Stine Marie Vørner on 15/12/2021.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI
import UIKit

//struct Buttons: View {
//
//    @ObservedObject var viewModel: odaViewModel = odaViewModel()
//    @ObservedObject var dataService: DataService = DataService()
//
//    var body: some View{
//
//        let basket = viewModel.liveUpdatedCount
//        let basketCount = filteredBasket.count
//
//        HStack(alignment: .bottom){
//            if basketCount > 0 {
//                Button{
//                    viewModel.intentRemoveFromBasket(
//                        p: product.id,
//                        g: product.gross_price)
//                    viewModel.getTotalSum()
//                }label:{
//                    Image(systemName: "minus.circle.fill")
//                        .resizable().frame(width: 32, height: 32, alignment: .leading)
//                }
//                Text("\(basketCount)")
//            }
//            Button{
//                viewModel.intentAddToBasket(
//                    p: product.id,
//                    g: product.gross_price)
//                viewModel.getTotalSum()
//            }label:{
//                 Image(systemName: "plus.circle.fill")
//            .resizable().frame(width: 32, height: 32, alignment: .leading)
//            .font(Font.title.weight(.light))
//            }
//        }
//
//        }
//}
//

