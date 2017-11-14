//
// Created by Guilherme Trilha on 14/11/17.
// Copyright (c) 2017 Marcos Schead. All rights reserved.
//

import Foundation
struct MoviePage: Codable {

    let page : Int
    let total_results: Int
    let total_pages: Int
    let results: [Movie]

}