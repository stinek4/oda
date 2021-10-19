//
//  odaData.swift
//  oda
//
//  Created by Stine Marie Vørner on 14/10/2021.
//

import Foundation

struct OdaData: Codable{
    let items: [Item]
}

struct Item: Codable{
    var product: Product
//    var quantity: Int
//    var display_price_total: String
//    let availability: Availability
}

struct Product: Codable, Identifiable {
    let id: Int
    let full_name: String
    let name: String
    let name_extra: String
    let images: [Images]
    let gross_price: String
    let gross_unit_price: String
//    let brand: String?
//    let brand_id: Int?
//    let front_url: String
//    let unit_price_quantity_abbreviation: String
//    let unit_price_quantity_name: String
//    let availability: Availability
}

struct Images: Codable{
    let thumbnail: thumbnail
    let large: large
}

struct thumbnail: Codable {
    let url: String
}
struct large: Codable {
    let url: String
}

//struct Availability: Codable {
//    let is_available: Bool
//    let code: String
//    let description: String
//    let description_short: String
//}
