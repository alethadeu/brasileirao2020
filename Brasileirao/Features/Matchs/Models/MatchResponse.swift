//
//  MatchResponse.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation

struct MatchResponse: Codable {
    let page, totalResult: Int
    let matchs: [Match]
    
    enum CodingKeys: String, CodingKey {
        case page, matchs
        case totalResult = "total_result"
    }
}

struct MatchDetailsResponse: Codable {
    let page, id: Int
    let actions: [Action]
    
    enum CodingKeus: String, CodingKey {
        case page, id, actions
    }
}
