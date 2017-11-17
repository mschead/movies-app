//
// Created by Marcos Schead on 14/11/17.
// Copyright (c) 2017 Marcos Schead. All rights reserved.
//

import Foundation
import ReSwift
import UIKit

struct SetMovieAction : StandardActionConvertible {

    static let type: String = "SET_MOVIE_ACTION"

    var movie: Movie
    var poster: UIImage

    init(movie: Movie, poster: UIImage) {
        self.movie = movie
        self.poster = poster
    }

    init(_ standardAction: StandardAction) {
        self.init(standardAction)
    }

    func toStandardAction() -> StandardAction {
        return StandardAction(type: SetMovieAction.type, payload: [:], isTypedAction: true)
    }

}
