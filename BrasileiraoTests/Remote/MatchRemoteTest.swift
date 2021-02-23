//
//  MatchRemoteTeste.swift
//  BrasileiraoTests
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation
import XCTest
@testable import Brasileirao

class MatchRemoteTest: XCTestCase {
    var serviceClient: ServiceClient?
    var mockContentData: Data {
        return getData(name: "matchList")
    }
    
    var mockContentDataDetails: Data {
        return getData(name: "matchDetails")
    }
    
    override func setUp() {
        serviceClient =  ServiceClient()
    }
    
    func testGetMatchList() {
        var matchResponse: MatchResponse?
        
        do {
            matchResponse =  try MatchResponse.decode(data: mockContentData)
        } catch {
            XCTAssertTrue(matchResponse != nil)
        }
        
        XCTAssertTrue(matchResponse != nil)
    }
    
    func testGetMatchDetail() {
        var matchDetailsResponse: MatchDetailsResponse?
        
        do {
            matchDetailsResponse =  try MatchDetailsResponse.decode(data: mockContentDataDetails)
        } catch {
            XCTAssertTrue(matchDetailsResponse != nil)
        }
        
        XCTAssertTrue(matchDetailsResponse != nil)
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
