//
//  ViewController.swift
//  KatchAppTest
//
//  Created by Christian Gonzalo on 10/23/19.
//  Copyright © 2019 Christian Gonzalo. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                self.regSegue()
            }
        }
    }
    
    func regSegue(){
        let storyBoard = UIStoryboard(name: "Digimon", bundle: nil)
        let viewController2 = storyBoard.instantiateViewController(withIdentifier: "DigimonVC")
        self.navigationController?.pushViewController(viewController2, animated: true)
    }

}
