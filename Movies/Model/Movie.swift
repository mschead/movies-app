//
//  Movie.swift
//  Movies
//
//  Created by Marcos Schead on 14/11/17.
//  Copyright © 2017 Marcos Schead. All rights reserved.
//

import Foundation
import UIKit

class Movie {
    
    init(nome: String, descricao: String, imagem: UIImage) {
        self.nome = nome
        self.descricao = descricao
        self.imagem = imagem
    }
    
    var imagem: UIImage
    var nome: String
    var descricao: String
    
}
