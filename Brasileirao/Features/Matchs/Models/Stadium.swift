//
//  Stadium.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation

struct Stadium: Codable {
    let name: String
    let capacity: Int
    let stateUf, city: String

    enum CodingKeys: String, CodingKey {
        case name, capacity
        case stateUf = "state_uf"
        case city
    }
}
