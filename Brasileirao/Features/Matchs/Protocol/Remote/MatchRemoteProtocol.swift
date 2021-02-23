//
//  MatchRemote.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation

protocol MatchRemoteProtocol {
    typealias getMatchList = NetworkResult<MatchResponse, HTTPFailureReason>
    typealias getMatchListCompletion = (_ result: getMatchList) -> Void
    typealias getMatchDetail = NetworkResult<MatchDetailsResponse, HTTPFailureReason>
    typealias getMatechDetailCompletion = (_ result: getMatchDetail) -> Void
    
    /// Método que retorna uma lista de partidas do servidor
    ///
    /// - Parameter completion: Uma tupla contendo um MatchResponse e um HTTPFailureReason
    func getMatchList(completion: @escaping getMatchListCompletion)
    
    
    /// Método que busca os eventos de uma partida
    /// 
    /// - Parameters:
    ///   - matchId: id da partida
    ///   - completion: Uma tupla contendo um array de Match e um HTTPFailureReason
    func getMatchDetail(matchId: Int, completion: @escaping getMatechDetailCompletion)
}
