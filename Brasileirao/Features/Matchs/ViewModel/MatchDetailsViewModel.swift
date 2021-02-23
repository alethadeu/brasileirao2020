//
//  MatchDetailsViewModel.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 15/01/21.
//

import Foundation

class MatchDetailsViewModel {
    var status = Box<FetchEvent>(.waiting)
    var repository: MatchRepositoryProtocol
    var dataSource = MatchDetailsDataSource()
    
    init() {
        self.repository = DependencyInjection.shared.container.resolve(MatchRepositoryProtocol.self)!
    }
    
    func getMatchDetails(matchId: Int) {
        self.status.value = .loading
        self.repository.getMatchDetails(matchId: matchId) { [self] result in
            switch result {
            case .success(payload: let actions):
                self.dataSource.data.value = actions
            case .failure(event: let fetchEvent):
                self.status.value = fetchEvent
            }
        }
    }
}
