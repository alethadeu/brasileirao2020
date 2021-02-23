//
//  MatchRepositoryProtocol.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation

protocol MatchRepositoryProtocol {
    typealias getMatchList = RepositoryResult<[Match], FetchEvent>
    typealias getMatchListCompletion = (_ result: getMatchList) -> Void
    typealias getMatchDetail = RepositoryResult<[Action], FetchEvent>
    typealias getMatchDetailCompletion = (_ result: getMatchDetail) -> Void

    func fetchMatchList(completion: @escaping getMatchListCompletion)
    func getMatchDetails(matchId: Int, completion: @escaping getMatchDetailCompletion)
}
