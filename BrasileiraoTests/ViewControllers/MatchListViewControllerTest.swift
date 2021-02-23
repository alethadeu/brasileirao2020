//
//  MatchListViewControllerTest.swift
//  BrasileiraoTests
//
//  Created by Alexandre Thadeu  on 02/02/21.
//

import Foundation
import XCTest
@testable import Brasileirao

class MatchListViewControllerTest: XCTestCase {
    let controller: MatchListViewController = MatchListViewController()
    let mockView: MatchListViewProtocol = MockMatchListView()
    let mockViewModel = MockMatchListViewModel()
    
    override func setUp() {
        mockViewModel.expectation = self.expectation(description: "FetchMatchList")
        controller.matchListView = mockView
        controller.matchListView?.setDataSource(datasource: mockViewModel.getDataSource())
        controller.matchListViewModel = mockViewModel
    }
    
    override func tearDown() {
        
    }
    
    func testGetMatchList() {
        controller.fetchMatchList()
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(controller.matchListViewModel!.getDataSource().data.value.count > 0)
    }
}
