//
//  MockMatchListViewModel.swift
//  BrasileiraoTests
//
//  Created by Alexandre Thadeu  on 03/02/21.
//

import Foundation
import XCTest
@testable import Brasileirao

class MockMatchListViewModel: MatchListViewModelProtocol {
    let repository: MatchRepositoryProtocol = MockMatchRepository()
    var dataSource = MatchListDataSource()
    var status = Box<FetchEvent>(.waiting)
    var expectation: XCTestExpectation?
    
    func fetchMatchList() {
        repository.fetchMatchList { result in
            switch result {
            case .success(payload: let matchs):
                self.dataSource.data.value = matchs
                self.status.value = .success(nil)
            case .failure(event: let event):
                self.status.value = event
                break
            }
            self.expectation?.fulfill()
        }
    }
    
    func getBoxStatus() -> Box<FetchEvent> {
       return status
    }
    
    func getDataSource() -> MatchListDataSource {
        return dataSource
    }
    
    func pullToRefresh() {
        
    }
    
    func setIsFirstLoading(loading: Bool) {

    }
    
        
}
