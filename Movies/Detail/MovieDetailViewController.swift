//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Marcos Schead on 14/11/17.
//  Copyright © 2017 Marcos Schead. All rights reserved.
//

import UIKit
import ReSwift

class MovieDetailViewController: UIViewController, StoreSubscriber {
    typealias StoreSubscriberStateType = MovieDetailState
    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var generoLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MovieDetailService().getGenres(page: 1) { (result) in
            switch result {
            case .success(let genres):
                let result = self.getMovieGenresNames(genreMovieIds: mainStore.state.movieDetailState.genresId, allGenres: genres).joined(separator: ", ")
                mainStore.dispatch(SetMovieGenresAction(genres: result))
            case .failure(let error):
                fatalError("error: \(error.localizedDescription)")
            }
        }

        mainStore.subscribe(self, selector: { $0.movieDetailState })
    }

    func newState(state: MovieDetailState) {
        thumbImageView.image = state.thumbImage
        nomeLabel.text = state.nome
        anoLabel.text = state.ano
        generoLabel.text = state.generos
        descricaoLabel.text = state.descricao
    }

    fileprivate func getMovieGenresNames(genreMovieIds: [Int], allGenres: [Genre]) -> [String] {
        return allGenres.filter { genre in
            genreMovieIds.contains(genre.id)
        }.map { genre in
            return genre.name
        }
    }


}
