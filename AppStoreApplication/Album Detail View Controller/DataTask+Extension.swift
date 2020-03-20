//
//  DataTask+Extension.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/19/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation

extension URLSession {
    
    func dataTaskWith<T: Decodable>(forType dataType: T.Type, request: URLRequest, completion: (([T]?, Error?) -> Void)?) -> URLSessionDataTask {
        
        return dataTask(with: request) { (data, _, error) in
            guard let data = data, error == nil else {
                completion?(nil, error)
                return
            }
            let decoder = JSONDecoder()
            do {
               let jsonData = try decoder.decode(Response<T>.self, from: data)
                completion?(jsonData.feed?.results, nil)
            } catch let jsonError{
                completion?(nil, jsonError)
            }
        }
    }
}
