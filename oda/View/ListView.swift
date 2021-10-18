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
        
        VStack(){
            VStack{
                Text("Shopping Cart")
                    .font(.system(size: 20).bold())
                    .accessibilityAddTraits(.isHeader)
            
                ScrollView{
                    ForEach(dataService.products){ product in
                        HStack(){
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
                                Text(product.name_extra)
                                    .foregroundColor(Color("SecondaryTextColor"))
                                    .multilineTextAlignment(.leading)
                                    .font(Font.custom("Rubik", size: 14))
                            }
                            VStack{
                                Text(product.gross_price)
                                    .foregroundColor(Color("PrimaryTextColor"))
                                    .multilineTextAlignment(.trailing)
                                    .font(Font.custom("Rubik", size: 14))
                                Text(product.gross_unit_price)
                                    .foregroundColor(Color("SecondaryTextColor"))
                                    .multilineTextAlignment(.trailing)
                                    .font(Font.custom("Rubik", size: 14))
                            }
                       
                            Spacer()
                            
                            HStack(alignment: .bottom){
                                Button{
                                    
                                }label:{
                                    Image(systemName: "minus.circle.fill")
                                        .resizable().frame(width: 32, height: 32, alignment: .leading)
                                }
                                Text("1")
                                
                                Button{
                                    
                                }label:{
                                    Image(systemName: "plus.circle.fill")
                                        .resizable().frame(width: 32, height: 32, alignment: .leading)
                                }
                            }

                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                        
                        Divider()
                    }
                }
            }
            .padding()
        }
        HStack(){
            Image(systemName: "cart")
                .resizable().frame(width: 24, height: 24, alignment: .leading)
            Text("11 products")
                .foregroundColor(Color("PrimaryTextColor"))
                .font(Font.custom("Rubik", size: 14))
            Spacer()
            Text("sum")
                .foregroundColor(Color("PrimaryTextColor"))
                .font(Font.custom("Rubik", size: 14))
        }
        .padding(.leading)
        .padding(.trailing)
    }
}
