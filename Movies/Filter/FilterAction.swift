//
// Created by Marcos Schead on 14/11/17.
// Copyright (c) 2017 Marcos Schead. All rights reserved.
//

import Foundation
import ReSwift

struct SetYearFiltroAction: StandardActionConvertible {
    static let type = "SETAR_ANO_FILTRO_ACTION"

    let year: String

    init(year: String) {
        self.year = year
    }

    init(_ standardAction: StandardAction) {
        self.init(standardAction)
    }

    func toStandardAction() -> StandardAction {
        return StandardAction(type: SetYearFiltroAction.type, payload: [:], isTypedAction: true)
    }
}
