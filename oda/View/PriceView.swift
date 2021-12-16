//
//  PriceView.swift
//  oda
//
//  Created by Stine Marie Vørner on 16/12/2021.
//

import Foundation
import Foundation
import SwiftUI

struct PriceView: View{
    var product: Product
    

    var body: some View{
        VStack{
            Text(product.gross_price + " kr")
                .foregroundColor(Color(Constants.Color.primaryTextColor))
                .multilineTextAlignment(.trailing)
                .font(Font.custom(Constants.Font.rubikRegular, size: 14).bold())
            Text("kr " + product.gross_unit_price + "/" + product.unit_price_quantity_abbreviation)
                .foregroundColor(Color(Constants.Color.secondaryTextColor))
                .multilineTextAlignment(.trailing)
                .font(Font.custom(Constants.Font.rubikRegular, size: 12))
        }
    }
}

