//
//  MoviesListingAction.swift
//  Movies
//
//  Created by Marcos Schead on 13/11/17.
//  Copyright © 2017 Marcos Schead. All rights reserved.
//

import Foundation
import ReSwift

struct SetMovieListAction : StandardActionConvertible {

    static let type: String = "SET_MOVIE_LIST_ACTION"

    let movies : [Movie]

    init(_ movies: [Movie]) {
        self.movies = movies
    }

    init(_ standardAction: StandardAction) {
        self.init(standardAction)
    }

    func toStandardAction() -> StandardAction {
        return StandardAction(type: SetMovieListAction.type, payload: [:], isTypedAction: true)
    }

}

struct ToggleSearchBarAction: StandardActionConvertible {

    static let type: String = "TOGGLE_SEARCH_BAR_ACTION"

    init() {}

    init(_ standardAction: StandardAction) {
        self.init(standardAction)
    }

    func toStandardAction() -> StandardAction {
        return StandardAction(type: ToggleSearchBarAction.type, payload: [:], isTypedAction: true)
    }
}

struct FilterBySearchAction: StandardActionConvertible {
    static let type: String = "FILTER_BY_SEARCH_ACTION"

    let searchParam: String

    init(searchParam: String) {
        self.searchParam = searchParam
    }

    init(_ standardAction: StandardAction) {
        self.init(standardAction)
    }

    func toStandardAction() -> StandardAction {
        return StandardAction(type: FilterBySearchAction.type, payload: [:], isTypedAction: true)
    }
}