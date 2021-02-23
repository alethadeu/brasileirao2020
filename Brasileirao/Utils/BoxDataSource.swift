//
//  BoxDataSource.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation

class BoxDataSource<T>: NSObject {
    var data: Box<[T]> = Box([])
    var isFirstLoading: Box<Bool> = Box<Bool>(false)
}
