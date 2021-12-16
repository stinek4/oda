//
//  ThumbnailView.swift
//  oda
//
//  Created by Stine Marie Vørner on 16/12/2021.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct ThumbnailView: View{
    let product: Product
    
    var body: some View{
        VStack{
            WebImage(url: URL(string: product.images[0].thumbnail.url))
                .resizable().scaledToFit()
        }
    }
}
