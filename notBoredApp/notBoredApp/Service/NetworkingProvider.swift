//
//  NetworkingProvider.swift
//  notBoredApp
//
//  Created by Braian Blas Theiler Scagliarini on 08/06/2022.
//

import Foundation
import Alamofire

struct NetworkingProvider {
    static let shared = NetworkingProvider()
    
    func getCategory(url: String, success: @escaping (_ category: Category) -> (), failure: @escaping (_ error: Error?) -> ()) {
    
        let statusOk = 200...299
        
        AF.request(url, method: .get).validate(statusCode: statusOk).responseDecodable (of: Category.self) { response in
            
            if let cat = response.value {
                success(cat)
            }
            else{
                failure(response.error)
                }
        }
    }
}
