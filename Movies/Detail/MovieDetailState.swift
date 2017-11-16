//
// Created by Marcos Schead on 14/11/17.
// Copyright (c) 2017 Marcos Schead. All rights reserved.
//

import Foundation
import ReSwift

struct MovieDetailState: StateType {

    var thumbImage: UIImage = UIImage(named: "thumb-no-image")!

    var nome: String = ""

    var ano: String = ""

    var genero: String = ""

    var descricao: String = ""

}
