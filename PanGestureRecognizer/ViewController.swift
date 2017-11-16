//
//  ViewController.swift
//  PanGestureRecognizer
//
//  Created by jorgemr on 15/11/17.
//  Copyright © 2017 jorge.mr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOfSquareViewsHorizontaly = 25
    var numberOfSquareViewsVerticaly = Int()
    var screen = [String:UIView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = view.frame.width / CGFloat(numberOfSquareViewsHorizontaly)
        numberOfSquareViewsVerticaly = Int(view.frame.height / width)
        for j in 0...numberOfSquareViewsVerticaly {
            for i in 0...numberOfSquareViewsHorizontaly {
                let squareView = UIView()
                squareView.frame = CGRect(x: CGFloat(i) * width , y: CGFloat(j) * width, width: width, height: width)
                squareView.backgroundColor = randomColor()
                view.addSubview(squareView)
                screen["\(j),\(i)"] = squareView
            }
        }
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(ViewController.expandView)))
    }

    func randomColor() -> UIColor {
        let redColor = CGFloat(arc4random_uniform(100))/100
        let greenColor = CGFloat(arc4random_uniform(100))/100
        let blueColor = CGFloat(arc4random_uniform(100))/100
        return UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
    }

    var selectedView : UIView?
    
    @objc func expandView(gesture: UIPanGestureRecognizer){
        let width = view.frame.width / CGFloat(numberOfSquareViewsHorizontaly)
        let position = gesture.location(in: self.view)
        let i = Int(position.x/width)
        let j = Int(position.y/width)
        guard let currentView = screen["\(j),\(i)"] else { return }
        if currentView != selectedView {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.selectedView?.layer.transform = CATransform3DIdentity
            }, completion: nil)
        }
        
        self.view.bringSubview(toFront: currentView)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                currentView.layer.transform = CATransform3DMakeScale(4, 4, 4)
        }, completion: nil)
        
        if gesture.state == .ended {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                currentView.layer.transform = CATransform3DIdentity
            }, completion: nil)
        }
        selectedView = currentView
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var prefersStatusBarHidden: Bool {return true}

}

