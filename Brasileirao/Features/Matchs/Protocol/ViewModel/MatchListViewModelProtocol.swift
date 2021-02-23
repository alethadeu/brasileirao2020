//
//  MatchListViewModelProtocol.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 16/01/21.
//

protocol MatchListViewModelProtocol {
    
    /// Método que busca pela primeira vez as lista de partidas
    func fetchMatchList()
    
    /// Método que retorna o Box do Status
    func getBoxStatus() -> Box<FetchEvent>
    
    /// Método que retorna o Box do Datasource
    func getDataSource() -> MatchListDataSource
    
    /// Método usado para fazer o pull to Refresh
    func pullToRefresh()
    
    /// Método usado para setar o isFirstLoading
    /// - Parameter loading: verdadeiro ou falso
    func setIsFirstLoading(loading: Bool)
}

