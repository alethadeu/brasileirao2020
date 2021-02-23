//
//  Router.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation
import Alamofire
/*
    Router funciona como uma classe abstrata, obrigando a quem implementa-lo preencha certas assinaturas
    Essas assinatura irão montar um request básico
*/

protocol Router: URLRequestConvertible {
    var baseUrl: String { get }
    var path: String { get }
    var requestURL: URL { get }
    var headers: HTTPHeaders { get }
    var parameters: Parameters? { get }
    var method: HTTPMethod { get }
    var enconding: ParameterEncoding { get }
    var urlRequest: URLRequest { get }
}

extension Router {
    var requestURL: URL {
        let urlString = "\(baseUrl)\(path)"
        return URL(string: urlString)!
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        headers.forEach { request.addValue($1, forHTTPHeaderField: $0) }
        return request
    }
    
    func asURLRequest() throws -> URLRequest {
        return try enconding.encode(urlRequest, with: parameters)
    }
    
}

