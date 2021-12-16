//
//  PromotionLabel.swift
//  oda
//
//  Created by Stine Marie Vørner on 16/12/2021.
//

import Foundation
import SwiftUI

struct PromotionLabel: View {
    var product: Product
    
    var body: some View{
        HStack{
            let title: String = product.promotion?.title ?? ""
            Text(title)
                .font(Font.custom(Constants.Font.rubikRegular, size: 10))
                .foregroundColor(Color(Constants.Color.primaryTextColor))
        }
        .frame(width: 30, height: 15, alignment: .center)
        .background(Color(Constants.Color.accentColor))
    
    }
}
