//
//  ScaleSegue.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import UIKit


class ScaleSegue: UIStoryboardSegue {
    override func perform() {
        scale()
    }
    
    func scale () {
        let toViewController = self.destination
        let fromViewController = self.source
        
        let containerView = fromViewController.view.superview
        let originalCenter = fromViewController.view.center
        
        toViewController.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        toViewController.view.center = originalCenter
        
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            toViewController.view.transform = CGAffineTransform.identity
        } completion: { success in
            fromViewController.present(toViewController, animated: false, completion: nil)
        }

    }
}

extension ScaleSegue : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        <#code#>
    }
}

class ScalePresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toViewController = transitionContext.viewController(forKey: .to)!
        let toView = transitionContext.view(forKey: .to)
        
        if let toView = toView {
            transitionContext.containerView.addSubview(toView)
        }
        
        toView?.frame = .zero
        toView?.layoutIfNeeded()
        
        let duration = transitionDuration(using: transitionContext)
        let finalFrame = transitionContext.finalFrame(for: toViewController)
        
        UIView.animate(withDuration: duration) {
            toView?.frame = finalFrame
            toView?.layoutIfNeeded()
        } completion: { finished in
            transitionContext.completeTransition(true)
        }
    }
    
}
