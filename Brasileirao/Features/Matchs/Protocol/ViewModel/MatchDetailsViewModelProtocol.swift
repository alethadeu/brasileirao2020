//
//  MatchDetailsViewModelProtocol.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 16/01/21.
//

import Foundation

protocol MatchDetailsViewModelProtocol {
    func getStatus() -> Box<FetchEvent>
    func getDataSource() -> MatchDetailsDataSource
    func getMatchDetails(matchId: Int)
}
