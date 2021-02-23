//
//  MatchDetailsViewModel.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 15/01/21.
//
import Foundation

class MatchDetailsViewModel: MatchDetailsViewModelProtocol {
    var status = Box<FetchEvent>(.waiting)
    var repository: MatchRepositoryProtocol
    var dataSource = MatchDetailsDataSource()
    
    init(repository: MatchRepositoryProtocol) {
        self.repository = DependencyInjection.shared.container.resolve(MatchRepositoryProtocol.self)!
    }
    
    func getMatchDetails(matchId: Int) {
        self.status.value = .loading
        self.dataSource.isFirstLoading.value = true
        self.repository.getMatchDetails(matchId: matchId) { [self] result in
            switch result {
            case .success(payload: let actions):
                self.dataSource.data.value = actions
                self.status.value = .success(nil)
            case .failure(event: let fetchEvent):
                self.status.value = fetchEvent
            }
        }
    }
    
    func getStatus() -> Box<FetchEvent> {
        return status
    }
    
    func getDataSource() -> MatchDetailsDataSource {
        return dataSource
    }
}
