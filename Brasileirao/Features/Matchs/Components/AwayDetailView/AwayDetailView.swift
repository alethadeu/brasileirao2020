//
//  AwayDetailView.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 15/01/21.
//

import UIKit

class AwayDetailView: UIView {

    var action: Action? {
        didSet {
            imageViewAction.image = action?.actionIcon
            labelMinute.text = action?.minutes
            labelDescription.text = action?.description
        }
    }
    
    lazy var labelDescription: UILabel = {
        let label = Theme.Label().primaryLabel
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()
    
    lazy var labelMinute: UILabel = {
        let label = Theme.Label().primaryLabel
        label.font = .systemFont(ofSize: 11)
        label.textAlignment = .center
        return label
    }()
    
    lazy var imageViewAction: UIImageView = {
        return UIImageView()
    }()
    
    lazy var viewDivider: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
        self.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        self.addSubview(labelDescription)
        self.addSubview(labelMinute)
        self.addSubview(imageViewAction)
        self.addSubview(viewDivider)
    }
    
    func layoutViews() {
        imageViewAction.snp.makeConstraints { make in
            make.width.height.equalTo(25)
            make.centerY.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(20)
        }
        
        labelMinute.snp.makeConstraints { make in
            make.topMargin.equalTo(imageViewAction.snp.bottom).offset(10)
            make.leading.trailing.equalTo(imageViewAction)
        }
        
        viewDivider.snp.makeConstraints { make in
            make.topMargin.equalToSuperview().offset(10)
            make.bottomMargin.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
            make.width.equalTo(2)
            make.right.equalTo(imageViewAction.snp.left).offset(-10)
        }
        
        labelDescription.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalTo(viewDivider.snp.left).offset(-10)
            make.centerY.equalToSuperview()
        }
    }
    
}
