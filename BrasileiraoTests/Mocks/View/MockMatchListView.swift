//
//  MockMatchListView.swift
//  BrasileiraoTests
//
//  Created by Alexandre Thadeu  on 02/02/21.
//

import Foundation
import XCTest
@testable import Brasileirao

class MockMatchListView: MatchListViewProtocol {
    var controller: UIViewController?
    var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .zero
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .secondarySystemBackground
        return collectionView
    }()
    
    func setDataSource(datasource: MatchListDataSource) {
        collectionView.dataSource = datasource
    }
    
    func getCollectionView() -> UICollectionView {
        return collectionView
    }
    
    func setController(controller: MatchListViewController) {
        self.controller = controller
    }
    
    func endRefreshing() {
        print("end refreshing")
    }
    
    func updateCollectionView() {
        print("update collection")
    }
    
    func setErrorView() {
        print("error")
    }
    
    
}
