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
            return setMovie(state: state!, movie: action.movie)
        default:
            return state!
        }
    }


    func setMovie(state: MovieDetailState, movie: Movie) -> MovieDetailState {
        var state = state
        state.name = movie.original_title
        return state
    }
}