//
//  DataModel.swift
//  ByteCoin
//
//  Created by Zignuts Tchnolab on 05/03/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation
struct  DataModel : Codable{
  let   rate : Double
    
    func rateString()-> String{
        return String(format: "%.f", rate)
    }
    
    
}
