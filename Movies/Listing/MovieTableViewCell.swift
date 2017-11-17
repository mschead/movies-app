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
    @IBOutlet weak var thumb: UIImageView!

    func setFieldValue(movie: Movie) {
        nome.text = movie.original_title
        thumb.downloadImageFrom(link: movie.poster_path, contentMode: UIViewContentMode.redraw)
    }
    
}
