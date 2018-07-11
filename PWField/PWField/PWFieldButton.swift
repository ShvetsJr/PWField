//
//  PWFieldButton.swift
//  PWField
//
//  Created by Alexander Shvets on 2018-07-11.
//  Copyright © 2018 Alexander Shvets. All rights reserved.
//

import UIKit

class PWFieldButton: UIButton {
    
    var delegate: PWField
    
    var onPress: (() -> ())?
    
    init(_ delegate: PWField) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        self.addTarget(self, action: #selector(complition), for: .touchUpInside)
        backgroundColor = delegate.blue
    }
    
    @objc private func complition() {
        onPress!()
    }
    
    func reset() {
        self.backgroundColor = delegate.blue
    }
    
    func fail() {
        self.backgroundColor = delegate.red
    }
    
    func success() {
        animateIn()
        
    }
    
    func animateIn() {
        
        guard let parentView = superview as? PWField else { return }
        
        let fieldFrame = parentView.frame
        let circleFrame = self.frame
        let circleDiameter = fieldFrame.height * 0.7
        
        let animationEndPoint = CGPoint(x: -fieldFrame.width + circleFrame.width + PWField.buttonSideOffset, y: (circleDiameter - fieldFrame.height) / 2)
        
        let circleLayer = CAShapeLayer()
        let startPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: circleFrame.width, height: circleFrame.width), cornerRadius: circleFrame.width / 2).cgPath
        let endShape = UIBezierPath(roundedRect: CGRect(x: animationEndPoint.x, y: animationEndPoint.y, width: fieldFrame.width, height: fieldFrame.height), cornerRadius: 25).cgPath
        circleLayer.path = startPath
        circleLayer.position = CGPoint(x: circleFrame.origin.x, y: circleFrame.origin.y)
        circleLayer.fillColor = delegate.green.cgColor
        parentView.layer.addSublayer(circleLayer)
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.toValue = endShape
        animation.duration = 0.2
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.fillMode = kCAFillModeBoth
        animation.isRemovedOnCompletion = true
        circleLayer.add(animation, forKey: animation.keyPath)
        
    }
    
    func animateOut() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
