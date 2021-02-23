//
//  Action.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 15/01/21.
//

import Foundation
import UIKit

struct Action: Codable {
    let team: TeamType
    let time: Int
    let action: ActionType
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case time, description
        case team = "team_type"
        case action = "action_type"
    }
    
    var actionIcon: UIImage {
        switch self.action {
            case .goal:
                return UIImage(named: "goal_icon")!
            case .expulsion:
                return UIImage(named: "redCard_icon")!
            case .penaltyLost:
                return UIImage(named: "penaltyLost_icon")!
        }
    }
    
    var minutes: String {
        return "\(time)'"
    }
}
