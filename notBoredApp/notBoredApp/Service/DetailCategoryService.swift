//
//  ListCategory.swift
//  notBoredApp
//
//  Created by Braian Blas Theiler Scagliarini on 08/06/2022.
//

import Foundation

//class DetailCategoryService {
//    
//    func getDetailCategory(onComplete: @escaping ([Category]) -> Void, onError: @escaping () -> Void) {
//        
//        ApiManager.shared.get(urlCategory) { response in
//            switch response {
//            case .success(let data):
//                do {
//                    if let data = data {
//                        let decoder = JSONDecoder()
//                        decoder.keyDecodingStrategy = .convertFromSnakeCase
//                        let listCategoryResponse = try decoder.decode(ListCategoryResponse.self, from: data)
//                        onComplete(listCategoryResponse.results)
//                    } else {
//                        onError()
//                    }
//                } catch {
//                    onError()
//                }
//            case .failure(_):
//                onError()
//            }
//        }
//        
//    }
//    
//}
