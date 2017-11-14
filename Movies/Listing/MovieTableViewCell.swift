//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Marcos Schead on 13/11/17.
//  Copyright © 2017 Marcos Schead. All rights reserved.
//

import Foundation
import UIKit

class MovieTableViewCell : UITableViewCell {

    @IBOutlet weak var nome: UILabel!
    
    func setFieldValue(movie: String) {
        nome.text = movie
    }
    
}
