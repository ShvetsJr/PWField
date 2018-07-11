//
//  PWField.swift
//  PWField
//
//  Created by Alexander Shvets on 2018-07-09.
//  Copyright © 2018 Alexander Shvets. All rights reserved.
//

import UIKit

class PWField: UITextField {
    
    static let buttonSideOffset = CGFloat(10)
    
    // Colors
    let blue = UIColor(red: 0.364706, green: 0.862745, blue: 0.952941, alpha: 1)
    let red = UIColor(red: 0.172549, green: 0.823529, blue: 0.435294, alpha: 1)
    let green = UIColor(red:0.03, green:0.93, blue:0.35, alpha:1.0)

    // Views
    lazy var placeholderLabel = self.makeLabel()
    lazy var actionButton = PWFieldButton(self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add placeholder title
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(placeholderLabel)
        placeholderLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 25).isActive = true
        placeholderLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        // Add action button
        actionButton.delegate = self
        self.addSubview(actionButton)
        actionButton.onPress = {
            self.actionButton.success()
        }
        
        // Customize self
        self.delegate = self
        self.tintColor = .clear
        self.backgroundColor = .white
        self.layer.cornerRadius = 25
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 7
        
    }
    
    @objc func fakeAPICall() {
        actionButton.success()
    }
    
    override func layoutSubviews() {
        // Action button setup
        let buttonDiameter = self.frame.height * 0.7
        
        actionButton.frame = CGRect(x: self.frame.width - buttonDiameter - PWField.buttonSideOffset, y: (self.frame.height / 2) - (buttonDiameter / 2) , width: buttonDiameter, height: buttonDiameter)
        actionButton.layer.cornerRadius = self.frame.height * 0.7 / 2
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: Delegate

extension PWField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if text.count <= 0 {
            self.placeholderLabel.transform = .identity
            UIView.animate(withDuration: 0.3) {
                self.placeholderLabel.transform = CGAffineTransform(translationX: -20, y: 0)
                self.placeholderLabel.alpha = 0
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if text.count < 1 {
            self.placeholderLabel.transform = CGAffineTransform(translationX: -20, y: 0)
            UIView.animate(withDuration: 0.3) {
                self.placeholderLabel.transform = .identity
                self.placeholderLabel.alpha = 1
            }
        }
    }
    
}

// MARK: Hepler

extension PWField {
    
}

// MARK: Factory

private extension PWField {
    
    func makeLabel() -> UILabel {
        let l = UILabel()
        l.text = "Password"
        l.textColor = UIColor.black.withAlphaComponent(0.25)
        l.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return l
    }
    
}
