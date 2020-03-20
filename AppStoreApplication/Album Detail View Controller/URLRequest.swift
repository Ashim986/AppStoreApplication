//
//  URLRequest.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/19/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation

extension URLRequest {
    static func getURLRequest(for urlString: String) -> URLRequest? {
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        let request = NSMutableURLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 1000)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField:  "Content-Type")
        
        return request as URLRequest
    }
}
