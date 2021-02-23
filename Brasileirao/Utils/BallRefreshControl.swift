//
//  BallRefreshControl.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 15/01/21.
//

import UIKit
import Lottie
import SnapKit

class BallRefreshControl: UIRefreshControl {
    private let animationView = Lottie.AnimationView(name: "soccerBallAnimation")
    private var isAnimating = false
    
    fileprivate let maxPullDistance: CGFloat = 150
    
    override init() {
        super.init(frame: .zero)
        setupView()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateProgress(with offsetY: CGFloat) {
        guard !isAnimating else { return }
        let progress = min(abs(offsetY / maxPullDistance), 1)
        animationView.currentProgress = progress
    }
    
    override func beginRefreshing() {
        super.beginRefreshing()
        isAnimating = true

    }
    
    override func endRefreshing() {
        super.endRefreshing()
        isAnimating = false
    }
    
    func setupView() {
        tintColor = .clear
        animationView.loopMode = .loop
        addSubview(animationView)
        
        addTarget(self, action: #selector(beginRefreshing), for: .valueChanged)
        animationView.currentProgress = 0
        animationView.play()
    }
    
    func setupLayout() {
        animationView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.width.height.equalTo(60)
        }
    }
}


