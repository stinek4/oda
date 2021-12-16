//
//  PromotionPriceView.swift
//  oda
//
//  Created by Stine Marie Vørner on 16/12/2021.
//

import Foundation
import SwiftUI

struct PromotionPriceView: View{
    var product: Product
    

    var body: some View{
        VStack{
            let discount: String = product.discount?.undiscounted_gross_price ?? ""

                Text(product.gross_price + " kr")
                    .foregroundColor(Color(Constants.Color.accentColor))
                    .multilineTextAlignment(.trailing)
                    .font(Font.custom(Constants.Font.rubikRegular, size: 14).bold())
                Text("kr " + discount)
                    .strikethrough()
                    .foregroundColor(Color(Constants.Color.secondaryTextColor))
                    .multilineTextAlignment(.trailing)
                    .font(Font.custom(Constants.Font.rubikRegular, size: 12))
            }
        }
    }

