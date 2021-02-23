//
//  MatchDetailsView.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 16/01/21.
//

import UIKit
import SnapKit

class MatchDetailsView: UIView, MatchDetailsViewProtocol  {
    
    var collectionHeightConstraint: Constraint?
    var controller: MatchDetailsViewController?
    
    //MARK: - Components
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    lazy var bottomAuxView = UIView()
    lazy var viewContent: UIView = {
        let viewContent = UIView()
        viewContent.backgroundColor = .secondarySystemBackground
        return viewContent
    }()
    
    lazy var matchHeader = MatchHeader()
    lazy var navigationHeader: MatchDetailsTitleHeaderView = {
        let header = MatchDetailsTitleHeaderView()
        header.delegate = self
        return header
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .zero
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MatchDetailsCollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCellIdentifier.matchDetailsCollectionViewCell)
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.delegate = self
        return collectionView
    }()
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
        self.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    func addViews() {
        addSubview(scrollView)
        scrollView.addSubview(viewContent)
        viewContent.addSubview(matchHeader)
        viewContent.addSubview(collectionView)
        viewContent.addSubview(navigationHeader)
        viewContent.addSubview(bottomAuxView)
        
    }
    
    func layoutViews() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        viewContent.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        navigationHeader.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(60)
        }
        
        
        matchHeader.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.topMargin.equalTo(navigationHeader.snp.bottom).offset(20)
            make.height.equalTo(250)
            
        }
        
        collectionView.snp.makeConstraints { make in
            collectionHeightConstraint = make.height.equalTo(self.collectionView.contentSize.height).constraint
            make.top.equalTo(matchHeader.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
        }
        
        bottomAuxView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.left.right.equalToSuperview()
            make.top.equalTo(collectionView.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
        }
    }
    
    //MARK: - Protocol
    func setDataSource(datasource: MatchDetailsDataSource) {
        self.collectionView.dataSource = datasource
    }
    
    func setController(controller: MatchDetailsViewController) {
        self.controller = controller
    }
    
    func setHeroId(id: String) {
        self.matchHeader.heroID = id
    }
    
    func setMatch(match: Match) {
        self.matchHeader.match = match
    }
    
    func getCollectionView() -> UICollectionView {
        return collectionView
    }
    
    private func updateCollectionHeight() {
        DispatchQueue.main.async {
            self.collectionHeightConstraint?.update(offset: self.collectionView.contentSize.height)
        }
    }
    
    func setEmptyOnCollection() {
        DispatchQueue.main.async {
            self.collectionHeightConstraint?.update(offset: 300.0)
            self.collectionView.setEmptyView(delegate: self)
        }
    }
    
    func restoreCollection() {
        self.collectionView.restoreBackground()
    }
    
    func updateCollection() {
        self.collectionView.restoreBackground()
        self.collectionView.reloadData()
        self.updateCollectionHeight()
    }
    
    func setErrorOnCollection() {
        DispatchQueue.main.async {
            self.collectionHeightConstraint?.update(offset: 300.0)
            self.collectionView.setErrorView(delegate: self)
        }
    }
}

extension MatchDetailsView: MatchDetailsTitleHeaderDelegate {
    func back() {
        self.controller?.navigationController?.popViewController(animated: true)
    }
}

extension MatchDetailsView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let baseHeight: CGFloat = 80
        let width = self.collectionView.frame.width
        
        return CGSize(width: width, height: baseHeight)
    }
}

extension MatchDetailsView: EmptyViewDelegate, ErrorViewDelegate {
    func backAction() {
        self.controller?.navigationController?.popViewController(animated: true)
    }
    
    func tryAgain() {
        self.controller?.getMatchDetails()
    }
    
}
