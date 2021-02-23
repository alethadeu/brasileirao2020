//
//  MatchListViewModel.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation

protocol MatchListViewModelProtocol {
    func fetchMatchList()
    func getBoxStatus() -> Box<FetchEvent>
    func getDataSource() -> MatchListDataSource
}

class MatchListViewModel: MatchListViewModelProtocol {
    private var dataSource = MatchListDataSource()
    private var status = Box<FetchEvent>(.waiting)
    private var repository: MatchRepositoryProtocol
    
    init(repository: MatchRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchMatchList() {
        status.value = .loading
        repository.fetchMatchList { result in
            switch result {
            case .success(payload: let matchs):
                self.status.value = .success(nil)
                self.dataSource.data.value = matchs
            case .failure(event: let fetchEvent):
                self.status.value = fetchEvent
            }
        }
    }
    
    func getBoxStatus() -> Box<FetchEvent> {
        return self.status
    }
    
    func getDataSource() -> MatchListDataSource {
        return self.dataSource
    }
}

