//
//  DependencyInjection.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation
import Swinject

class DependencyInjection {
    static let shared = DependencyInjection()
    let container = Container()
    
    func registerContainer() {
        registerRemote()
        registerRepository()
        registerViewModel()
    }
    
    private func registerRemote() {
        container.register(ServiceClientProtocol.self) { _ in ServiceClient() }
        container.register(MatchRemoteProtocol.self) { resolver in
            MatchRemote(serviceClient: resolver.resolve(ServiceClientProtocol.self)!)
        }
    }
    
    private func registerRepository() {
        container.register(MatchRepositoryProtocol.self) { resolver in
            MatchRepository(remote: resolver.resolve(MatchRemoteProtocol.self)!)
        }
    }
    
    private func registerViewModel() {
        container.register(MatchListViewModelProtocol.self) { resolver in
            MatchListViewModel(repository: resolver.resolve(MatchRepositoryProtocol.self)!)
        }
        
        container.register(MatchDetailsViewModelProtocol.self) { resolver in
            MatchDetailsViewModel(repository: resolver.resolve(MatchRepositoryProtocol.self)!)
        }
    }
}
