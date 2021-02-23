//
//  Box.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import Foundation
/*
 Box é classe que acaba simplificando o uso do Bond, optei por usar pois acho mais simples.
 link: https://gist.github.com/ANSCoder/a9acc86635cf71876d398f8a4e049726
*/
class Box<T>{
    
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet{
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?){
        self.listener = listener
        listener?(value)
    }
}
