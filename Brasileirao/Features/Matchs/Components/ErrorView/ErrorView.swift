//
//  ErrorView.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 17/01/21.
//

import UIKit

protocol ErrorViewDelegate {
    func tryAgain()
}

class ErrorView: UIView {
    var delegate: ErrorViewDelegate?
    
    lazy var labelMessage: UILabel = {
        let label = Theme.Label().primaryLabel
        label.text = "Estamos enfrentando algum problema :("
        label.textAlignment = .center
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tentar Novamente", for: .normal)
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
        addSubview(labelMessage)
        addSubview(button)
    }
    
    func layoutViews() {
        labelMessage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.centerY.equalToSuperview().inset(20)
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.topMargin.equalTo(labelMessage.snp.bottom).offset(20)
        }
    }
    
    //Actions
    @objc func didButtonClick(_ sender: Any) {
        delegate?.tryAgain()
    }
    
    
}
