//
//  MatchDetailsTitleHeaderView.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 02/02/21.
//

import Foundation
import UIKit

protocol MatchDetailsTitleHeaderDelegate {
    func back()
}

class MatchDetailsTitleHeaderView: UIView {
    var delegate: MatchDetailsTitleHeaderDelegate?
    
    //MARK: - Components
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
        return button
    }()
    
    lazy var navigationTitleLabel: UILabel = {
        let label = Theme.Label().titleLabel
        label.text = "Rodada 28"
        return label
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
    
    //MARK: - Layouts
    func addViews() {
        addSubview(backButton)
        addSubview(navigationTitleLabel)
    }
    
    func layoutViews() {
        backButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalTo(40)
        }
        
        navigationTitleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    //MARK: - Actions
    @objc func didButtonClick(_ sender: Any) {
        delegate?.back()
    }
    
    
}


