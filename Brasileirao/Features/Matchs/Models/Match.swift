//
//  Match.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation

struct Match: Codable {
    let id, date: Int
    let homeTeam, awayTeam: Team
    let matchResult: MatchResult?
    let location: Stadium

    enum CodingKeys: String, CodingKey {
        case id, date
        case homeTeam = "home_team"
        case awayTeam = "away_team"
        case matchResult = "match_result"
        case location
    }
    
    var dateDayAndMonth: String {
        let components = dateValue.get(.day, .month)
        if let day = components.day, let month = components.month {
            return "\(day.toDateString())/\(month.toDateString())"
        }
        return "A combinar"
    }
    
    var dateHour: String {
        let components = dateValue.get(.hour, .minute)
        if let hour = components.hour, let minute = components.minute {
            return "\(hour.toDateString()):\(minute.toDateString())"
        }
        return "A combinar"
    }
    
    private var dateValue: Date {
        let timeInterval = TimeInterval(date)
        let myDate = Date(timeIntervalSince1970: timeInterval)
        return myDate
    }
}

