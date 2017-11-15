//
//  ViewController.swift
//  PanGestureRecognizer
//
//  Created by jorgemr on 15/11/17.
//  Copyright © 2017 jorge.mr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numberOfSquareViews = 15
        let width = view.frame.width / CGFloat(numberOfSquareViews)
        let numberOfSquareViewsY = Int(view.frame.height / width)
        print(numberOfSquareViewsY)
        for j in 0...numberOfSquareViewsY {
            for i in 0...numberOfSquareViews {
                let squareView = UIView()
                squareView.frame = CGRect(x: CGFloat(i) * width , y: CGFloat(j) * width, width: width, height: width)
                squareView.backgroundColor = randomColor()
                view.addSubview(squareView)
            }
        }
    }

    func randomColor() -> UIColor {
        let redColor = CGFloat(arc4random_uniform(100))/100
        let greenColor = CGFloat(arc4random_uniform(100))/100
        let blueColor = CGFloat(arc4random_uniform(100))/100
        return UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

