//
//  EmptyView.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 16/01/21.
//

import UIKit
import Lottie

protocol EmptyViewDelegate {
    func backAction()
}

class EmptyView: UIView {
    var delegate: EmptyViewDelegate?
    
    lazy var labelNotFound1: UILabel = {
        let label = Theme.Label().secondaryLabel
        label.font = .systemFont(ofSize: 100)
        label.text = "4"
        return label
    }()
    
    lazy var labelNotFound2: UILabel = {
        let label = Theme.Label().secondaryLabel
        label.font = .systemFont(ofSize: 100)
        label.text = "4"
        return label
    }()
    
    lazy var animationView: AnimationView = {
        let animationView = AnimationView(name: "soccerBallAnimation")
        animationView.loopMode = .loop
        animationView.play()
        return animationView
    }()
    
    lazy var labelMessage: UILabel = {
        let label = Theme.Label().titleLabel
        label.text = "PARTIDA AINDA NÃO INICIADA"
        return label
        
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Voltar", for: .normal)
        button.addTarget(self, action: #selector(didButtonClick), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Layout
    func addViews() {
        addSubview(labelNotFound1)
        addSubview(labelNotFound2)
        addSubview(labelMessage)
        addSubview(animationView)
        addSubview(backButton)
    }
    
    func layoutViews() {
        animationView.snp.makeConstraints { make in
            make.centerY.equalToSuperview().inset(35)
            make.width.height.equalTo(100)
            make.centerX.equalToSuperview()
        }
        
        labelNotFound1.snp.makeConstraints { make in
            make.right.equalTo(animationView.snp.left).offset(-20)
            make.centerY.equalTo(animationView.snp.centerY)
        }
        
        labelNotFound2.snp.makeConstraints { make in
            make.left.equalTo(animationView.snp.right).offset(20)
            make.centerY.equalTo(animationView.snp.centerY)
        }
        
        labelMessage.snp.makeConstraints { make in
            make.leading.equalTo(labelNotFound1.snp.leading)
            make.trailing.equalTo(labelNotFound2.snp.trailing)
            make.topMargin.equalTo(animationView.snp.bottom).offset(20)
        }
        
        backButton.snp.makeConstraints { make in
            make.topMargin.equalTo(labelMessage.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
    }
    
    //Actions
    @objc func didButtonClick(_ sender: Any) {
        delegate?.backAction()
    }

}
