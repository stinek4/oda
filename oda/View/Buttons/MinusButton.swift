//
//  MinusButton.swift
//  oda
//
//  Created by Stine Marie Vørner on 16/12/2021.
//

import Foundation
import SwiftUI

struct WhiteMinusButton: View{

    var body: some View{
        VStack{
            Image(systemName: Constants.Icons.whiteMinusIcon)
                .resizable().frame(width: 32, height: 32, alignment: .leading)
                .foregroundColor(Color(Constants.Color.secondaryTextColor))
        }
    }
}
