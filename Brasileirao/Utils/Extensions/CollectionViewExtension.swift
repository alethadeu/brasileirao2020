//
//  CollectionViewExtension.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 16/01/21.
//

import UIKit
import SnapKit

extension UICollectionView {
    func setEmptyView(delegate: EmptyViewDelegate) {
        let contentView = UIView(frame: CGRect(x: 0,
                                               y: 0,
                                               width: self.bounds.size.width,
                                               height: self.bounds.size.height)
        )
        let emptyView = EmptyView()
        emptyView.delegate = delegate
        contentView.addSubview(emptyView)
        emptyView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundView = contentView
    }
    
    func setErrorView(delegate: ErrorViewDelegate) {
        let contentView = UIView(frame: CGRect(x: 0,
                                               y: 0,
                                               width: self.bounds.size.width,
                                               height: self.bounds.size.height)
        )
        
        let errorView = ErrorView()
        errorView.delegate = delegate
        contentView.addSubview(errorView)
        errorView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundView = contentView
    }
    
    func restoreBackground() {
        self.backgroundView = nil
    }
}
