//
//  Movie.swift
//  Movies
//
//  Created by Marcos Schead on 14/11/17.
//  Copyright © 2017 Marcos Schead. All rights reserved.
//

import Foundation
import UIKit

struct Movie : Codable {

    var vote_count: Int
    var id: Int
    var video: Bool
    var vote_average: Double
    var title: String
    var popularity: Double
    var poster_path: String
    var original_language: String
    var original_title: String
    var genre_ids: [Int]
    var backdrop_path: String
    var adult: Bool
    var overview: String
    var release_date: String

}
