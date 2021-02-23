//
//  MatchList.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 16/01/21.
//

import Foundation
import UIKit
import SnapKit

class MatchListView: UIView, MatchListViewProtocol {

    
    
    //MARK: - Components
    private(set) lazy var collectionView: UICollectionView = {
        let refreshControl = BallRefreshControl()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .zero
        let cell = UINib(nibName: "MatchCollectionViewCell", bundle: nil)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(cell, forCellWithReuseIdentifier: CollectionViewCellIdentifier.matchListCollectionViewCell)
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.refreshControl = refreshControl

        collectionView.delegate = self
        return collectionView
    }()
    
    var controller: MatchListViewController?
    
    
    //MARK: - Lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide)
            make.trailing.equalTo(self.safeAreaLayoutGuide)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    //MARK: - Protocol Implementations
    func setDataSource(datasource: MatchListDataSource) {
        self.collectionView.dataSource = datasource
    }
    
    func getCollectionView() -> UICollectionView {
        return collectionView
    }
    
    func setController(controller: MatchListViewController) {
        self.controller = controller
    }
    
    func endRefreshing() {
        self.collectionView.refreshControl?.endRefreshing()
    }
    
}

//MARK: - Collection Delegate
extension MatchListView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let baseHeight: CGFloat = 210
        let width = self.collectionView.frame.width - 30
        
        return CGSize(width: width, height: baseHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let controller = controller,
              let dataSource = controller.matchListViewModel?.getDataSource() else { return }
        controller.performSegue(withIdentifier: "segueToMatchDetail", sender: dataSource.data.value[indexPath.row])
    }
    
}
