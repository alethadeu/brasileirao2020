//
//  MatchRemote.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation

class MatchRemote: MatchRemoteProtocol {

    private let serviceClient: ServiceClientProtocol
    init(serviceClient: ServiceClientProtocol) {
        self.serviceClient = serviceClient
    }
    
    func getMatchList(completion: @escaping getMatchListCompletion) {
        serviceClient.doRequest(router: MatchRouter.getMatchList) { result in
            switch result {
                case .success(payload: let data):
                    do {
                        let matchResponse = try MatchResponse.decode(data: data)
                        completion(.success(payload: matchResponse))
                    } catch {
                        completion(.failure(.none))
                    }
                    break
                case .failure(let reason):
                    completion(.failure(reason))
                    break
            }
        }
    }
    
    func getMatchDetail(matchId: Int, completion: @escaping getMatechDetailCompletion) {
        serviceClient.doRequest(router: MatchRouter.getMatchDetails(matchdId: matchId)) { result in
            switch result {
            case .success(payload: let data):
                do {
                    let response = try MatchDetailsResponse.decode(data: data)
                    completion(.success(payload: response))
                } catch {
                    completion(.failure(.none))
                }
                break
            case .failure(let reason):
                completion(.failure(reason))
            }
        }
    }
    
}
