//
//  MockMatchRepository.swift
//  BrasileiraoTests
//
//  Created by Alexandre Thadeu  on 03/02/21.
//

import Foundation
@testable import Brasileirao

class MockMatchRepository: MatchRepositoryProtocol {
    var remote: MatchRemoteProtocol = MockMatchRemote()
    
    func fetchMatchList(completion: @escaping getMatchListCompletion) {
        remote.getMatchList { result in
            switch(result) {
            case .success(payload: let matchResponse):
                completion(.success(payload: matchResponse.matchs))
            case .failure(.badRequest):
                completion(.failure(event: .error(message: "Error")))
            case .failure(.none):
                completion(.failure(event: .error(message: "Error")))
            case .failure(.some(.notFound)):
                completion(.failure(event: .empty(message: "Não há jogos")))
            case .failure(.some(.noNetwork)):
                completion(.failure(event: .error(message: "No networking")))
            }
        }
    }
    
    func getMatchDetails(matchId: Int, completion: @escaping getMatchDetailCompletion) {
        
    }
}
