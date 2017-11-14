//
//  MoviesListingAction.swift
//  Movies
//
//  Created by Marcos Schead on 13/11/17.
//  Copyright © 2017 Marcos Schead. All rights reserved.
//

import Foundation
import ReSwift

struct SetMovieAction : StandardActionConvertible {
    
    static let type: String = "SET_MOVIE_ACTION"
    
    init(_ standardAction: StandardAction) {
        self.init(standardAction)
    }
    
    func toStandardAction() -> StandardAction {
        return StandardAction(type: SetMovieAction.type, payload: [:], isTypedAction: true)
    }
    
}


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