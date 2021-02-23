//
//  MatchRouter.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation
import Alamofire

/*
    Enum composto de todos as possíveis rotas da coleção MATCH
    Essa coleção abranje os jogos do Brasileirão
    Contendo dois endpoints:
        - Lista dos Jogos
        - Detalhe de um Jogo específico
 */

enum MatchRouter: Router, URLRequestConvertible {
   
    case getMatchList
    case getMatchDetails(matchdId: Int)
    
    var baseUrl: String {
        return API.baseURLString
    }
    
    var path: String {
        switch self {
            case .getMatchList:
                return "/matchs"
            case .getMatchDetails(let matchId):
                return "/matchs/details/\(matchId)"
        }
    }
    
    var headers: HTTPHeaders {
        return ["Content-Type":"application/x-www-form-urlencoded"]
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var enconding: ParameterEncoding {
        return URLEncoding.default
    }
}
