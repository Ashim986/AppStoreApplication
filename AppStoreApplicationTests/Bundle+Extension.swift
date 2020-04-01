//
//  Bundle+Extension.swift
//  AppStoreApplicationTests
//
//  Created by ashim Dahal on 4/1/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Decodable> (for type: T.Type, file: String) -> T? {
        if let urlPath = path(forResource: file, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: urlPath), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let jsonData = try? decoder.decode(T.self, from: data)
                return jsonData
            } catch let jsonError {
                print(jsonError.localizedDescription)
            }
        }
        return nil
    }
}
