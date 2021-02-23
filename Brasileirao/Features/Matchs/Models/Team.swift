//
//  Team.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation
import UIKit

struct Team: Codable {
    let id: Int
    let name, fullName: String
    let crestURL: String
    
    var crestImage: UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageView.sd_setImage(with: URL(string: crestURL))
        return imageView
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case fullName = "full_name"
        case crestURL = "crest_url"
    }
}
