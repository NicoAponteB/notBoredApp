//
//  Category.swift
//  notBoredApp
//
//  Created by Braian Blas Theiler Scagliarini on 08/06/2022.
//

import Foundation

struct Category: Codable {
    
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
    let accessibility: Double

}
