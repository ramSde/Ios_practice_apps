//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
protocol CoinManagerDelegate{
    func didupdatedata(datamodel:DataModel )
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "23DDA452-2A7F-41DC-A048-09B02A391736"
    var delegate : CoinManagerDelegate?
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
   
    func getData( currency : String){
        let session = URLSession(configuration: .default)
        if   let url = URL(string:"\(baseURL)/\(currency)?apikey=\(apiKey)"){
           let task = session.dataTask(with: url){
                (data,response,error) in
                if let safeData = data {
                    do{
                        let newdata =   try  JSONDecoder().decode(DataModel.self, from: safeData )
                        
                        self.delegate?.didupdatedata(datamodel:  newdata)
                    
                        
                    }
                    catch{
                        print(error)
                    }
                    
                    
                    
                }
               
            }
            
            task.resume()
        }
  
       
    }
    
    
}
