//
//  ServiceClientProtocol.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation

protocol ServiceClientProtocol {
    typealias requestResult = NetworkResult<Data, HTTPFailureReason>
    typealias requestCompletion = (_ result: requestResult) -> Void
    
    /// Método que faz a request no servidor.
    /// 
    /// - Parameters:
    ///   - router: Objeto Router, que serve como a rota utilizada para fazer o request
    ///   - completion: Uma tupla contendo Data e HTTPFailureReason
    func doRequest(router: Router, completion: @escaping requestCompletion)
    
    /// Método que loga no console o request para faciltiar a visualização do mesmo
    ///
    /// - Parameters:
    ///   - request: Objeto URLRequest, não obrigatório
    ///   - response: Objeto HTTPURLResponse, não obrigatório
    func logRequestAndResponse(request: URLRequest?, response: HTTPURLResponse? )
}
