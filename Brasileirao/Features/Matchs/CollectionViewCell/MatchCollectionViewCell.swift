//
//  MatchCollectionViewCell.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 15/01/21.
//

import UIKit
import SnapKit
import Hero

class MatchCollectionViewCell: UICollectionViewCell {
    lazy var matchHeader = MatchHeader()
    var match: Match? {
        didSet {
            guard let match = match else { return }
            matchHeader.heroID = "\(match.id)"
            matchHeader.match = match
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isSkeletonable = true
        self.contentView.addSubview(matchHeader)
        matchHeader.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
