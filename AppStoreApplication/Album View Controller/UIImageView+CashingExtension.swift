//
//  UIImageView+CashingExtension.swift
//  AppStoreApplication
//
//  Created by ashim Dahal on 3/16/20.
//  Copyright © 2020 ashim Dahal. All rights reserved.
//

import UIKit

let imageCashe = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImageUingCasheWithUrlString(urlString : String){
       // check for cache Image first
        self.image = nil
        if let cashedImage = imageCashe.object(forKey: urlString as NSString){
            self.image = cashedImage
            return
        }
        
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, respons, error) in
                // Displaying image for which data is available
                // If data is not available image will set to default instead of throwing error.
                guard let data = data, error == nil else {
                    print(error?.localizedDescription as Any)
                    return
                }
                DispatchQueue.main.async {
                    if let downloadedImage = UIImage(data : data) {
                        imageCashe.setObject(downloadedImage, forKey: (urlString as NSString))
                }
               self.image = UIImage(data: data)
                }
            }).resume()
        }
    }
}
