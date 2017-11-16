//
// Created by Marcos Schead on 16/11/17.
// Copyright (c) 2017 Marcos Schead. All rights reserved.
//

import Foundation
import UIKit

class AppUtils {

    static let URL_IMAGES = "https://image.tmdb.org/t/p/w300/"

    static func getImageFromURL(url: String) -> UIImage {
        let url = URL(string: URL_IMAGES + url)
        let data = try? Data(contentsOf: url!)

        if let data = data {
            return UIImage(data: data)!
        }

        return UIImage(named: "thumb-no-image")!
    }

}
