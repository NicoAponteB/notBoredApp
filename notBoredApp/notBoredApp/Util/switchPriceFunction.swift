//
//  switchPriceFunction.swift
//  notBoredApp
//
//  Created by Nicolas Aponte Barrera on 9/06/22.
//

import Foundation

func getPrice(price: Double) -> String{
    
    switch price {
        
    case 0:
        return "Free"
    case 0.1...0.3:
        return "Low"
    case 0.4...0.6:
        return "Medium"
    default:
        return "High"
    }
}
