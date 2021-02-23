//
//  MatchListViewController.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import UIKit

class MatchListViewController: UIViewController, HasCustomView {
    
    typealias CustomView = MatchListView
    
    //MARK: - View e ViewModel
    var matchListView: MatchListViewProtocol?
    var matchListViewModel: MatchListViewModelProtocol?
    
    //MARK: - Lifecycle
    override func loadView() {
        let customView = CustomView()
        view = customView
        view.backgroundColor = .secondarySystemBackground
        if let mlView = view as? MatchListViewProtocol {
            matchListView = mlView
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupViewModel()
        self.setDataSource()
        self.configBox()
        self.setPullToRefresh()
        self.fetchMatchList()
    }
    

    //MARK: - Setup e Injeção de Dependencias
    func setupView() {
        matchListView?.setController(controller: self)
    }
    
    func setupViewModel() {
        let mlViewModelProtocol = DependencyInjection.shared.container.resolve(MatchListViewModelProtocol.self)!
        self.matchListViewModel = mlViewModelProtocol
    }
    
    private func setDataSource() {
        guard let datasource = matchListViewModel?.getDataSource() else { return }
        self.matchListView?.setDataSource(datasource: datasource)
    }
    
    
    //MARK: - Config Box
     func configBox() {
        matchListViewModel?.getDataSource().isFirstLoading.bind(listener: { isFirstLoading in
            if isFirstLoading {
                self.matchListView?.updateCollectionView()
            }
        })
        
        matchListViewModel?.getDataSource().data.bind(listener: { _ in
            self.matchListView?.updateCollectionView()
        })
        
        matchListViewModel?.getBoxStatus().bind(listener: { event in
            switch event {
            case .error(_):
                if let data = self.matchListViewModel?.getDataSource().data.value, data.count <= 0 {
                    self.matchListView?.setErrorView()
                }
                break
            case .loading:
                break
            case .success:
                self.matchListView?.endRefreshing()
            case .waiting, .empty:
                break
            }
        })
    }
    
    //MARK: - Helpers
    func fetchMatchList() {
        matchListViewModel?.fetchMatchList()
    }
    
    func setPullToRefresh() {
        self.matchListView?.getCollectionView().refreshControl?.addTarget(self, action: #selector(refreshMatchList), for: .valueChanged)
    }
    
    @objc private func refreshMatchList() {
        self.matchListViewModel?.pullToRefresh()
    }
    
    func segueToMatchDetails(match: Match) {
        let matchDetailsVC = MatchDetailsViewController()
        matchDetailsVC.match = match
        matchDetailsVC.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoomOut)
        self.navigationController?.pushViewController(matchDetailsVC, animated: true)
    }
}
