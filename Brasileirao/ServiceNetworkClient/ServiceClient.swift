//
//  ServiceClient.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation
import Alamofire

class ServiceClient: ServiceClientProtocol {
    
    func doRequest(router: Router, completion: @escaping requestCompletion) {
        if NetworkState.isConnected() {
            Alamofire.request(router)
                .validate()
                .responseJSON { response  in
                    self.logRequestAndResponse(request: response.request, response: response.response)
                    switch response.result  {
                    case .success:
                        guard let data = response.data else {
                            
                            if let statusCode = response.response?.statusCode, statusCode >= 200 &&  statusCode < 300 {
                                let data = Data(count: 1)
                                completion(.success(payload: data))
                            }
                            
                            completion(.failure(nil))
                            return
                        }
                        completion(.success(payload: data))
                        
                    case .failure(_):
                        if let statusCode = response.response?.statusCode, let reason = HTTPFailureReason(rawValue: statusCode) {
                            completion(.failure(reason))
                        } else {
                            completion(.failure(nil))
                        }
                    }
            }
        } else {
            completion(.failure(.noNetwork))
        }

    }
    
    func logRequestAndResponse(request: URLRequest?, response: HTTPURLResponse? ) {
        if let request = request {
            NSLog("Request to: \(request.url?.absoluteString ?? "--")")
            //NSLog("Headers: \(request.allHTTPHeaderFields ?? [:])/n")
            NSLog("Method: \(request.httpMethod ?? "--")")
        }
        
        if let response = response {
            NSLog("Response Status Code: \(response.statusCode)")
        }
        
        NSLog("----------------------------------------------------------------")
    }
    
}
