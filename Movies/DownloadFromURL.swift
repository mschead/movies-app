//
// Created by Marcos Schead on 17/11/17.
// Copyright (c) 2017 Marcos Schead. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func downloadImageFrom(link: String, contentMode: UIViewContentMode) {
        URLSession.shared.dataTask( with: NSURL(string: "https://image.tmdb.org/t/p/w300" + link)! as URL, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                self.contentMode =  contentMode
                if let data = data { self.image = UIImage(data: data) }
            }
        }).resume()
    }
    
}
