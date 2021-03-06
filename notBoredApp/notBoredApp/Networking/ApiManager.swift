//
//  ApiManager.swift
//  notBoredApp
//
//  Created by Braian Blas Theiler Scagliarini on 08/06/2022.
//

import Foundation
import Alamofire

class ApiManager {
    
    static let shared = ApiManager()
    
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response { response in
            completion(response.result)
        }
    }
    
}
