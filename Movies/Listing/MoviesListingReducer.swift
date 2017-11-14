//
//  MoviesListingReducer.swift
//  Movies
//
//  Created by Marcos Schead on 14/11/17.
//  Copyright © 2017 Marcos Schead. All rights reserved.
//

import Foundation
import ReSwift

struct MoviesListingReducer : Reducer {

    typealias ReducerStateType = MoviesListingState

    func handleAction(action: Action, state: MoviesListingState?) -> MoviesListingState {
        return MoviesListingState()
    }
    
}
