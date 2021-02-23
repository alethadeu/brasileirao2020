//
//  CollectionViewCellExtension.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 15/01/21.
//

import UIKit

extension UICollectionViewCell {
    
    private func addBorderOnCell(_ radius: CGFloat = 5) {
        contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        contentView.clipsToBounds = true
    }
    
    private func addShadowOnCell() {
        layer.backgroundColor = UIColor.white.cgColor
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 1.5, height: 1.5);
        layer.shadowRadius = 1.5
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.clear.cgColor
        
    }
    
    func toCard(_ radius: CGFloat = 5) {
        addBorderOnCell(radius)
        addShadowOnCell()
    }
}
