//
// Created by Marcos Schead on 14/11/17.
// Copyright (c) 2017 Marcos Schead. All rights reserved.
//

import Foundation
import ReSwift

struct FilterReducer: Reducer {

    typealias ReducerStateType = FilterState

    func handleAction(action: Action, state: FilterState?) -> FilterState {
        if state == nil {
            return FilterState()
        }

        switch action {
            case let action as SetYearFiltroAction:
                return setarAnoFiltro(state: state!, action: action)
            default:
                return state!
        }

    }

    func setarAnoFiltro(state: FilterState, action: SetYearFiltroAction) -> FilterState {
        var state = state
        state.year = action.year
        return state
    }
}
