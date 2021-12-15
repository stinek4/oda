//
//  ListViewItem.swift
//  oda
//
//  Created by Stine Marie Vørner on 15/12/2021.
//
//import SwiftUI
//import SDWebImageSwiftUI
//import UIKit
//import Foundation
//
//
//class ListViewItems: ObservableObject {
//    @Binding var filteredBasket: [Int]!
//    @Binding var basketCount: Int!
//
////    @Binding var product: ListView.product
////    @Binding var i: ListView.i
////    @Binding var basketCount: ListView.basketCount
////
//    @ObservedObject var viewModel: odaViewModel = odaViewModel()
//    @ObservedObject var dataService: DataService = DataService()
//
//    struct ListViewItem: View{
//    var body: some View{
//
//        ZStack{
//            WebImage(url: URL(string: product.images[0].thumbnail.url))
//                .resizable()
//                .scaledToFit()
//                .padding(.trailing, 2)
//        }.frame(width: 56, height: 56, alignment: .center)
//
//        VStack(alignment: .leading){
//            Text(product.name)
//                .foregroundColor(Color("PrimaryTextColor"))
//                .multilineTextAlignment(.leading)
//                .font(Font.custom("Rubik", size: 14))
//                .font(Font.title.weight(.bold))
//            Text(product.name_extra)
//                .foregroundColor(Color("SecondaryTextColor"))
//                .multilineTextAlignment(.leading)
//                .font(Font.custom("Rubik", size: 14))
//        }
//        Spacer()
//        VStack{
//            if basketCount == 0 {
//                Text(product.gross_price)
//                    .foregroundColor(Color("PrimaryTextColor"))
//                    .multilineTextAlignment(.trailing)
//                    .font(Font.custom("Rubik", size: 14))
//                Text(product.gross_unit_price)
//                    .foregroundColor(Color("SecondaryTextColor"))
//                    .multilineTextAlignment(.trailing)
//                    .font(Font.custom("Rubik", size: 14))
//            }
//        }
//
//    //MARK: Buttons
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
//    }}
//}
