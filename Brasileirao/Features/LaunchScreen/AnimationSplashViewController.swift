//
//  AnimationSplashViewController.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import UIKit
import Lottie

class AnimationSplashViewController: UIViewController {
    
    var animationView: AnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        animationView = .init(name: "soccerPlayer")
        animationView?.frame = view.bounds
        animationView?.animationSpeed = 1.2
        view.addSubview(animationView!)
        animationView?.play(fromFrame: SoccerPlayerKeyFrames.start.value, toFrame: SoccerPlayerKeyFrames.end.value, loopMode: .none, completion: { _ in
            let keyWindow = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .map({$0 as? UIWindowScene})
                    .compactMap({$0})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
            
            let viewController = MatchListViewController()
            let navigationController = UINavigationController()
            navigationController.isHeroEnabled = true
            navigationController.setViewControllers([viewController], animated: true)
            
            let snapshot = (keyWindow?.snapshotView(afterScreenUpdates: true))!
            viewController.view.addSubview(snapshot)
            viewController.navigationItem.title = "Brasileirão 2020"

            keyWindow?.rootViewController = navigationController
            UIView.transition(with: snapshot,
                              duration: 0.4,
                              options: .transitionCrossDissolve,
                              animations: {
                                  snapshot.layer.opacity = 0
                              },
                              completion: { status in
                                  snapshot.removeFromSuperview()
                              })
            
        })
    }


}
