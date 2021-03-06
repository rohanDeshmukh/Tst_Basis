//
//  RequestHandler.swift
//  Tst_Basis
//
//  Created by Rohan Deshmukh on 09/07/20.
//  Copyright © 2020 RohanDeshmukh. All rights reserved.
//

import Foundation

class RequestHandler {
    
    let reachability = Reachability()!
    
//    func networkResult<T: Parcelable>(completion: @escaping ((Result<[T], ErrorResult>) -> Void)) ->
//        ((Result<Data, ErrorResult>) -> Void) {
//
//            return { dataResult in
//
//                DispatchQueue.global(qos: .background).async(execute: {
//                    switch dataResult {
//                    case .success(let data) :
//                        ParserHelper.parse(data: data, completion: completion)
//                        break
//                    case .failure(let error) :
//                        print("Network error \(error)")
//                        completion(.failure(.network(string: "Network error " + error.localizedDescription)))
//                        break
//                    }
//                })
//
//            }
//    }
    
    func networkResult<T: Parcelable>(completion: @escaping ((Result<T, ErrorResult>) -> Void)) ->
        ((Result<Data, ErrorResult>) -> Void) {
            
            return { dataResult in
                
                DispatchQueue.global(qos: .background).async(execute: {
                    switch dataResult {
                    case .success(let data) :
                        ParserHelper.parse(data: data, completion: completion)
                        break
                    case .failure(let error) :
                        print("Network error \(error)")
                        completion(.failure(.network(string: "Network error " + error.localizedDescription)))
                        break
                    }
                })
                
            }
    }
}

