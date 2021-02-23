//
//  MatchListViewProtocol.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 16/01/21.
//
import UIKit

protocol MatchListViewProtocol {
    
    /// Método que seta o dataSource na collectionview
    ///
    /// - Parameter datasource: utilizar o MatchListDataSource
    func setDataSource(datasource: MatchListDataSource)
    
    /// Método que retorna a collectionView
    func getCollectionView() -> UICollectionView
    
    /// Método que seta a controller da view
    ///
    /// - Parameter controller: um objeto de MatchListViewController
    func setController(controller: MatchListViewController)
    
    /// Para com o refreshing da collectionview
    func endRefreshing()
    
    /// Método utilizado para atualizar a collectionview
    func updateCollectionView()
    
    /// Seta um error no background da collectionview
    func setErrorView()
}
