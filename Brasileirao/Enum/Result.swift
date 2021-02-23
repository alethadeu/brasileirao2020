//
//  Result.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation

enum NetworkResult<T, U> where U: Error {
    case success(payload: T)
    case failure(U?)
}

enum RepositoryResult<T, U> {
    case success(payload: T)
    case failure(event: U)
}
