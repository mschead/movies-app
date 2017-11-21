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
        case _ as ToggleSearchBarAction:
            return toggleSearchBar(state: state!)
        case let action as FilterBySearchAction:
            return filterBySearch(state: state!, action: action)
        case let action as ApplyFilterAction:
            return filterByYear(state: state!, action: action)
        case let action as ClearFilterAction:
            return clearFilter(state: state!, action: action)
        default:
            return state!
        }
    }


    func setMovies(state: MoviesListingState, movies: [Movie]) -> MoviesListingState {
        var state = state
        state.movies = movies
        state.filteredMovies = movies
        return state
    }

    func toggleSearchBar(state: MoviesListingState) -> MoviesListingState {
        var state = state
        state.isSearchBarHidden = !state.isSearchBarHidden
        if state.isSearchBarHidden {
            state.filteredMovies = state.movies
        }
        return state
    }

    func filterBySearch(state: MoviesListingState, action: FilterBySearchAction) -> MoviesListingState {
        var state = state
        if action.searchParam.isEmpty {
            state.filteredMovies = state.movies
        } else {
            state.filteredMovies = state.movies.filter { movie in
                return movie.title.range(of: action.searchParam) != nil
            }
        }

        return state
    }

    func filterByYear(state: MoviesListingState, action: ApplyFilterAction) -> MoviesListingState {
        var state = state

        if action.year.isEmpty {
            state.filteredMovies = state.movies
        } else {
            state.filteredMovies = state.movies.filter {movie in
                return movie.release_date.range(of: action.year) != nil
            }
        }

        return state
    }

    func clearFilter(state: MoviesListingState, action: ClearFilterAction) -> MoviesListingState {
        var state = state
        state.filteredMovies = state.movies
        return state
    }

}
