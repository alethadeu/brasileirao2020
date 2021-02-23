//
//  MockMatchRemote.swift
//  BrasileiraoTests
//
//  Created by Alexandre Thadeu  on 03/02/21.
//

import Foundation
@testable import Brasileirao

class MockMatchRemote: MatchRemoteProtocol {
    var mockContentData: Data {
        return getData(name: "matchList")
    }
    
    var mockContentDataDetails: Data {
        return getData(name: "matchDetails")
    }
    
    func getMatchList(completion: @escaping getMatchListCompletion) {
        var matchResponse: MatchResponse?
        do {
            matchResponse =  try MatchResponse.decode(data: mockContentData)
            completion(.success(payload: matchResponse!))
        } catch {
            completion(.failure(.notFound))
        }
    }
    
    func getMatchDetail(matchId: Int, completion: @escaping getMatechDetailCompletion) {
        var matchDetailsResponse: MatchDetailsResponse?
        do {
            matchDetailsResponse =  try MatchDetailsResponse.decode(data: mockContentDataDetails)
            completion(.success(payload: matchDetailsResponse!))
        } catch {
            completion(.failure(.notFound))
        }
    }
    
    
    private func getData(name: String, withExtension: String = "json") -> Data {
        let bundle = Bundle(for: MatchRemoteTest.self)
        guard let filePath = bundle.path(forResource: name, ofType: withExtension) else {
            fatalError("Couldn't read data.json file")
        }
        
        let fileUrl = URL(fileURLWithPath: filePath)
        let data = try! Data(contentsOf: fileUrl)
        return data
    }
    
    
}
