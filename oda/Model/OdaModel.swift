//
//  odaModel.swift
//  oda
//
//  Created by Stine Marie Vørner on 14/10/2021.
//

import Foundation

struct OdaModel{
    
    var currentUrl: String = EndPoint.hostJSON
    
    
    mutating func passURL(){
        currentUrl = EndPoint.hostJSON
    }
    
}
