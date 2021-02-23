//
//  SoccerPlayerKeyFrame.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation
import UIKit

enum SoccerPlayerKeyFrames {
    case start
    case end
    
    var value: CGFloat {
        switch self {
        case .start:
            return 0.0
        case .end:
            return  150.0
            
        }
    }
}
