//
//  MatchListViewModel.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//
import Foundation


class MatchListViewModel: MatchListViewModelProtocol {

    
    private var dataSource = MatchListDataSource()
    private var status = Box<FetchEvent>(.waiting)
    private var repository: MatchRepositoryProtocol
    
    init(repository: MatchRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchMatchList() {
        status.value = .loading
        dataSource.isFirstLoading.value = true
        repository.fetchMatchList { result in
            switch result {
            case .success(payload: let matchs):
                self.dataSource.isFirstLoading.value = false
                self.status.value = .success(nil)
                self.dataSource.data.value = matchs
            case .failure(event: let fetchEvent):
                self.dataSource.isFirstLoading.value = false
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
    
    func pullToRefresh() {
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
    
    func setIsFirstLoading(loading: Bool) {
        self.dataSource.isFirstLoading.value = loading
    }
}
