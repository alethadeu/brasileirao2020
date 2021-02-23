//
//  HasCustomView.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 02/02/21.
//

import Foundation
import UIKit

/*
 Referencia de código do modelo hoje utilizado pela Movile para facilitar o uso do viewcode
 link: https://movile.blog/escrevendo-view-code-mais-limpo-usando-loadview/
*/

public protocol HasCustomView {
    associatedtype CustomView: UIView
}

extension HasCustomView where Self: UIViewController {
    public var customView: CustomView {
        guard let customView = view as? CustomView else {
            fatalError("Expected view to be of type \(CustomView.self) but got \(type(of: view)) instead")
        }
        return customView
   }
}
