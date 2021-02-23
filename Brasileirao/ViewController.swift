//
//  ViewController.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import UIKit
import Lottie

enum SoccerPlayKeyFrames {
    case start
    case end
    
    var value: CGFloat {
        switch self {
        case .start:
            return 0.0
        case .end:
            return  140.0
            
        }
    }
}

class ViewController: UIViewController {
    
    var animationView: AnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        animationView = .init(name: "soccerPlayer")
        animationView?.frame = view.bounds
        animationView?.loopMode = .loop
        animationView?.animationSpeed = 1.2
        view.addSubview(animationView!)
        animationView?.play(fromFrame: SoccerPlayKeyFrames.start.value, toFrame: SoccerPlayKeyFrames.end.value, loopMode: .none, completion: { _ in
            
        })
    }


}

