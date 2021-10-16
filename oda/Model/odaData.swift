//
//  odaData.swift
//  oda
//
//  Created by Stine Marie Vørner on 14/10/2021.
//

import Foundation

struct OdaData: Codable{
    let product: [Product]
}

struct Product: Codable{
    let id: Int
    let name: String
    let images: [Images]
    let gross_price: Int
    let gross_unit_price: Int
}

//CHECK IF RUNNING
    //self.images.thumbnail.url
    //self.images.large.url
struct Images: Codable{
    let thumbnail: String
    let large: String
}
