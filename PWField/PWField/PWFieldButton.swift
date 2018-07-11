//
//  PWFieldButton.swift
//  PWField
//
//  Created by Alexander Shvets on 2018-07-11.
//  Copyright © 2018 Alexander Shvets. All rights reserved.
//

import UIKit

class PWFieldButton: UIButton {
    
    var onPress: (() -> ())?
    
    let blue = UIColor(red: 0.364706, green: 0.862745, blue: 0.952941, alpha: 1)
    let red = UIColor(red: 0.172549, green: 0.823529, blue: 0.435294, alpha: 1)
    let green = UIColor(red:0.03, green:0.93, blue:0.35, alpha:1.0)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
       
        self.addTarget(self, action: #selector(complition), for: .touchUpInside)
        
        backgroundColor = blue
        
    }
    
    @objc private func complition() {
        onPress!()
    }
    
    func reset() {
        self.backgroundColor = blue
    }
    
    func fail() {
        self.backgroundColor = red
    }
    
    func success() {
        self.backgroundColor = green
        
        
//        let frameForCircle = UIApplication.shared.keyWindow!.convert(self.seeAllButton.frame, from: self)
//        let displayLength = sqrt(pow(UIScreen.main.bounds.width, 2.0) + pow(UIScreen.main.bounds.height, 2.0))
//        
//        let circleLayer = CAShapeLayer()
//        let startPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: buttonMaxSize, height: buttonMaxSize), cornerRadius: buttonMaxSize / 2).cgPath
//        let endShape = UIBezierPath(roundedRect: CGRect(x: -displayLength, y: -displayLength, width: displayLength * 2, height: displayLength * 2), cornerRadius: displayLength).cgPath
//        circleLayer.path = startPath
//        circleLayer.position = CGPoint(x: frameForCircle.origin.x, y: frameForCircle.origin.y)
//        circleLayer.fillColor = R.color.orange.cgColor
//        UIApplication.shared.keyWindow!.layer.addSublayer(circleLayer)
//        
//        let animation = CABasicAnimation(keyPath: "path")
//        animation.toValue = endShape
//        animation.duration = 0.4
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
//        animation.fillMode = kCAFillModeBoth
//        animation.isRemovedOnCompletion = true
//        circleLayer.add(animation, forKey: animation.keyPath)
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//            circleLayer.removeFromSuperlayer()
//            self.isAnimating = false
//            closure()
//        }
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
