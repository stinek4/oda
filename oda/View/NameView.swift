//
//  NameView.swift
//  oda
//
//  Created by Stine Marie Vørner on 16/12/2021.
//

import Foundation
import SwiftUI

struct NameView: View{
    var product: Product

    var body: some View{
        VStack{
            Text(product.name)
                .foregroundColor(Color(Constants.Color.primaryTextColor))
                .multilineTextAlignment(.leading)
                .font(Font.custom(Constants.Font.rubikRegular, size: 14).bold())
               
        }
    }
}
