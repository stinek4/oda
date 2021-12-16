//
//  NameExtraView.swift
//  oda
//
//  Created by Stine Marie Vørner on 16/12/2021.
//

import Foundation
import SwiftUI

struct NameExtraView: View{
    var product: Product
    

    var body: some View{
        VStack{
            let isAvailable = product.availability.is_available || false
            
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
    }
}
