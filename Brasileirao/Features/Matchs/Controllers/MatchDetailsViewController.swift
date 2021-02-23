//
//  MatchDetailViewController.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 15/01/21.
//

import UIKit
import SnapKit
import Hero

class MatchDetailsViewController: UIViewController, HasCustomView {
    typealias CustomView = MatchDetailsView
    var match: Match?
    var matchDetailsViewModel: MatchDetailsViewModelProtocol?
    var matchDetailsView: MatchDetailsViewProtocol?
    
    //MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func loadView() {
        let customView = CustomView()
        view = customView
        view.isUserInteractionEnabled = true
        if let mdView = view as? MatchDetailsViewProtocol {
            matchDetailsView = mdView
        }
        self.hero.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
        self.setupView()
        self.setDataSource()
        self.configBox()
        self.getMatchDetails()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: - Setups
    func setupView() {
        matchDetailsView?.setController(controller: self)
        if let match = match {
            matchDetailsView?.setHeroId(id: "\(match.id)")
            matchDetailsView?.setMatch(match: match)
        }
    }
    
    func setupViewModel() {
        let mdViewModelProtocol = DependencyInjection.shared.container.resolve(MatchDetailsViewModelProtocol.self)!
        self.matchDetailsViewModel = mdViewModelProtocol
    }
    
    private func setDataSource() {
        guard let dataSource = matchDetailsViewModel?.getDataSource() else { return }
        matchDetailsView?.setDataSource(datasource: dataSource)
    }
    
    //MARK: - Configs
    func configBox() {
        self.matchDetailsViewModel?.getDataSource().data.bind(listener: { _ in
            self.matchDetailsView?.updateCollection()
        })
        
        self.matchDetailsViewModel?.getStatus().bind(listener: { status in
            switch status {
            case .empty(_):
                self.matchDetailsView?.setEmptyOnCollection()
            case .error(_):
                self.matchDetailsView?.setErrorOnCollection()
                break
            case .success:
                break
            case .loading:
                break
            case .waiting:
                break
            }
        })
    }
    
    func getMatchDetails() {
        guard let matchId = match?.id else { return }
        self.matchDetailsViewModel?.getMatchDetails(matchId: matchId)
    }
}

