//
//  FirstScreenViewController.swift
//  KatchAppTest
//
//  Created by Christian Gonzalo on 10/24/19.
//  Copyright © 2019 Christian Gonzalo. All rights reserved.
//

import UIKit

class FirstScreenViewController: UIViewController {

    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    func setUpElements(){
        Utilities.styleFilledButton(logInButton)
        Utilities.styleFilledButton(signUpButton)
    }
    
}
