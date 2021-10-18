//
//  odaViewModel.swift
//  oda
//
//  Created by Stine Marie Vørner on 14/10/2021.
//

import Foundation

class odaViewModel: ObservableObject{
        
    var model: OdaModel = OdaModel()
    
    //calls on passURL() to get ahold of Endpoints url
    init(){
        model.passURL()
    }

}
