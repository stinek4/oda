//
//  Header.swift
//  oda
//
//  Created by Stine Marie Vørner on 16/12/2021.
//

import Foundation
import SwiftUI

struct Header: View{

    var body: some View{
        VStack{
            Text("Shopping Cart")
                .font(Font.custom(Constants.Font.rubikRegular, size: 20).bold())
                .accessibilityAddTraits(.isHeader)
        }
    }
}
