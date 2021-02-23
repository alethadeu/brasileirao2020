//
//  MatchRepository.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation

class MatchRepository: MatchRepositoryProtocol {

    private let remote: MatchRemoteProtocol
    
    init(remote: MatchRemoteProtocol) {
        self.remote = remote
    }
    
    func fetchMatchList(completion: @escaping getMatchListCompletion) {
        remote.getMatchList { result in
            switch result {
                case .success(payload: let matchResponse):
                    completion(.success(payload: matchResponse.matchs))
    
            case .failure(.notFound?):
                completion(.failure(event: .empty(message: "Não há partidas para o campeonato")))
                
            case .failure(.none), .failure(.badRequest?):
                completion(.failure(event: .error(message: "Estamos com algum problema, tente novamente mais tarde.")))
            case .failure(.noNetwork?):
                completion(.failure(event: .error(message: "Sem conexão com a Internet, fique online e tente de novo.")))
                

            }
        }
    }
    
    func getMatchDetails(matchId: Int, completion: @escaping getMatchDetailCompletion) {
        remote.getMatchDetail(matchId: matchId) { result in
            switch result {
            case .success(payload: let response):
                let actions = response.actions.sorted {
                    $0.time > $1.time
                }
                completion(.success(payload: actions))
                
            case .failure(.notFound?):
                completion(.failure(event: .empty(message: "Partida ainda não foi iniciada")))
                
            case .failure(.none), .failure(.badRequest?):
                completion(.failure(event: .error(message: "Estamos com algum problema, tente novamente mais tarde.")))
            case .failure(.noNetwork?):
                completion(.failure(event: .error(message: "Sem conexão com a Internet, fique online e tente de novo.")))
            }
        }
    }
    
}
