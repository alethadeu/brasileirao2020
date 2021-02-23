//
//  HTTPFailureReason.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation

enum HTTPFailureReason: Int, Error {
    case notFound = 404
    case badRequest = 400
    case noNetwork = 0
}
