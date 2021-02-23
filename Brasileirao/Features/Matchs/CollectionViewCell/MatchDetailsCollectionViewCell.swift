//
//  MatchDetailsCollectionViewCell.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 15/01/21.
//

import UIKit
import SnapKit

class MatchDetailsCollectionViewCell: UICollectionViewCell {
    var action: Action? {
        didSet {
            guard let action = action else { return }
            
            if action.team == .home {
                viewHomeDetail.action = action
                viewHomeDetail.isHidden = false
                viewAwayDetail.isHidden = true
            } else {
                viewAwayDetail.action = action
                viewAwayDetail.isHidden = false
                viewHomeDetail.isHidden = true
            }
        }
    }
    
    lazy var viewHomeDetail = HomeDetailView()
    lazy var viewAwayDetail = AwayDetailView()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        self.contentView.addSubview(stackView)
        self.stackView.addArrangedSubview(viewHomeDetail)
        self.stackView.addArrangedSubview(viewAwayDetail)
    }
    
    func layoutViews() {
        self.stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        viewHomeDetail.isHidden = true
        viewAwayDetail.isHidden = true
    }
    
}
