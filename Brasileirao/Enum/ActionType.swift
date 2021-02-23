//
//  ActionType.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 15/01/21.
//

import Foundation

enum ActionType: String, Codable {
    case goal = "GOL",
         expulsion = "EXPULSAO",
         penaltyLost = "PENALTI_PERDIDO"
}
