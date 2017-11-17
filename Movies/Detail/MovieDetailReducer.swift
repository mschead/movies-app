//
// Created by Marcos Schead on 14/11/17.
// Copyright (c) 2017 Marcos Schead. All rights reserved.
//

import Foundation
import ReSwift

struct MovieDetailReducer: Reducer {

    typealias ReducerStateType = MovieDetailState

    func handleAction(action: Action, state: MovieDetailState?) -> MovieDetailState {
        if state == nil {
            return MovieDetailState()
        }
        switch action {
        case let action as SetMovieAction:
            return setMovie(state: state!, movie: action.movie, image: action.poster)
        case let action as SetMovieGenresAction:
            return setMovieGenres(state: state!, genres: action.genres)
        default:
            return state!
        }
    }


    func setMovie(state: MovieDetailState, movie: Movie, image: UIImage) -> MovieDetailState {
        var state = state
        state.nome = movie.original_title
        state.descricao = movie.overview
        state.ano = movie.release_date
        state.thumbImage = image
        state.genresId = movie.genre_ids
        return state
    }

    func setMovieGenres(state: MovieDetailState, genres: String) -> MovieDetailState {
        var state = state
        state.generos = genres
        return state
    }


}