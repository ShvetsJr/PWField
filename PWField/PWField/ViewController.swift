//
//  ViewController.swift
//  PWField
//
//  Created by Alexander Shvets on 2018-07-09.
//  Copyright © 2018 Alexander Shvets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var passwordField = PWField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(passwordField)
        passwordField.frame = CGRect(x: UIScreen.main.bounds.width * 0.1, y: UIScreen.main.bounds.height / 2 - 27, width: UIScreen.main.bounds.width * 0.8, height: 55)
        
        view.backgroundColor = .white
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAway)))
        
    }
    
    @objc func tapAway() {
        self.view.endEditing(true)
    }

}

