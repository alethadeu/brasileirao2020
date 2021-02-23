//
//  Themes.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 01/02/21.
//

import Foundation
import UIKit
import SnapKit

struct Theme {
    struct Label {
        let titleLabel: UILabel =  {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 17)
            label.textColor = .label
            label.numberOfLines = 1
            label.textAlignment = .center
            label.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .horizontal)
            return label
        }()
        
        let secondaryLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = .secondaryLabel
            label.numberOfLines = 1

            return label
        }()
        
        let primaryLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 17)
            label.textColor = .label
            label.numberOfLines = 1

            return label
        }()
        
        let higlightLabel: UILabel = {
           let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 28)
            label.textColor = .label
            label.numberOfLines = 1
            
            return label
        }()
    }
    
    struct ImageView {
        let crestImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
    }
    
}


