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
    
        guard let parentView = superview else { return }
        
        let fieldFrame = parentView.frame
        let circleFrame = self.frame
        let circleDiameter = fieldFrame.height * 0.7
        
        let animationEndPoint = CGPoint(x: -fieldFrame.width + circleFrame.width + PWField.buttonSideOffset, y: (circleDiameter - fieldFrame.height) / 2)
        
        let circleLayer = CAShapeLayer()
        let startPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: circleFrame.width, height: circleFrame.width), cornerRadius: circleFrame.width / 2).cgPath
        let endShape = UIBezierPath(roundedRect: CGRect(x: animationEndPoint.x, y: animationEndPoint.y, width: fieldFrame.width, height: fieldFrame.height), cornerRadius: 25).cgPath
        circleLayer.path = startPath
        circleLayer.position = CGPoint(x: circleFrame.origin.x, y: circleFrame.origin.y)
        circleLayer.fillColor = green.cgColor
        parentView.layer.addSublayer(circleLayer)

        let animation = CABasicAnimation(keyPath: "path")
        animation.toValue = endShape
        animation.duration = 0.2
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.fillMode = kCAFillModeBoth
        animation.isRemovedOnCompletion = true
        circleLayer.add(animation, forKey: animation.keyPath)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
