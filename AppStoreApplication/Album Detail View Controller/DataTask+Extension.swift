//
//  DataTask+Extension.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/19/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation

extension URLSession {
    
    func dataTaskWith<T: Decodable>(forType dataType: T.Type, request: URLRequest, completion: ((Result<[T]?, Error>) -> Void)?) -> URLSessionDataTask {
        
        return dataTask(with: request) { (data, _, error) in
            guard let data = data else {
                if let error = error {
                    completion?(.failure(error))
                }
                return
            }
            let decoder = JSONDecoder()
            do {
               let jsonData = try decoder.decode(Response<T>.self, from: data)
                completion?(.success(jsonData.feed?.results))
                
            } catch let jsonError{
                completion?(.failure(jsonError))
            }
        }
    }
}
