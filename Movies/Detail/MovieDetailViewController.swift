//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Marcos Schead on 14/11/17.
//  Copyright © 2017 Marcos Schead. All rights reserved.
//

import UIKit
import ReSwift

class MovieDetailViewController: UIViewController, StoreSubscriber{
    typealias StoreSubscriberStateType = MovieDetailState
    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var generoLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainStore.subscribe(self, selector: { $0.movieDetailState })
    }

    func newState(state: MovieDetailState) {
        thumbImageView.image = state.thumbImage
        nomeLabel.text = state.nome
        anoLabel.text = state.ano
        generoLabel.text = state.genero
        descricaoLabel.text = state.descricao
    }
}
