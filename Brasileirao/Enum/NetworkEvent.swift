//
//  NetworkEvent.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation

enum FetchEvent: Error {
    case error(message: String)
    case empty(message: String)
    case loading
    case success(Any?)
    case waiting
}
