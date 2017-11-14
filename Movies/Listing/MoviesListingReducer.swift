//
//  MoviesListingReducer.swift
//  Movies
//
//  Created by Marcos Schead on 14/11/17.
//  Copyright © 2017 Marcos Schead. All rights reserved.
//

import Foundation
import ReSwift

struct MoviesListingReducer: Reducer {

    typealias ReducerStateType = MoviesListingState

    func handleAction(action: Action, state: MoviesListingState?) -> MoviesListingState {
        if state == nil {
            return MoviesListingState()
        }
        switch action {
        case let action as SetMovieListAction:
            return setMovies(state: state!, movies: action.movies)
        default:
            return state!
        }
    }


    func setMovies(state: MoviesListingState, movies: [Movie]) -> MoviesListingState {
        var state = state
        state.movies = movies
        return state
    }
}
