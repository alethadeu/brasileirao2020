
import Foundation
import UIKit
import SnapKit

class MatchListView: UIView, MatchListViewProtocol {
    var controller: MatchListViewController?

    //MARK: - Components
    private(set) lazy var collectionView: UICollectionView = {
        let refreshControl = BallRefreshControl()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .zero
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MatchCollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCellIdentifier.matchListCollectionViewCell)
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.refreshControl = refreshControl

        collectionView.delegate = self
        return collectionView
    }()
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layouts
    func addViews() {
        addSubview(collectionView)
        
    }
    
    func layoutViews(){
        collectionView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(self.safeAreaLayoutGuide)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
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
        self.collectionView.restoreBackground()
    }
    
    func setErrorView() {
        self.collectionView.setErrorView(delegate: self)
    }
    
    func updateCollectionView() {
        self.collectionView.reloadData()
        self.collectionView.restoreBackground()
    }

}

extension MatchListView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let baseHeight: CGFloat = 225
        let width = self.collectionView.frame.width - 30
        
        return CGSize(width: width, height: baseHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let controller = controller,
              let dataSource = controller.matchListViewModel?.getDataSource() else { return }
        controller.segueToMatchDetails(match: dataSource.data.value[indexPath.row])
    }
    
}

extension MatchListView: ErrorViewDelegate {
    func tryAgain() {
        controller?.matchListViewModel?.fetchMatchList()
    }

}
