//
//  LoginViewController.swift
//  Sleep Tracker
//
//  Created by cmh-bstudent on 2/2/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var usernameLabel: UITextField!
    @IBOutlet var passwordLabel: UITextField!
    @IBOutlet var incorrectLabel: UILabel!
    @IBOutlet var tryAgainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        navigationItem.hidesBackButton = true
        incorrectLabel.isHidden = true
        tryAgainLabel.isHidden = true
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        tryAgainLabel.isHidden = true
        incorrectLabel.isHidden = true
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        tryAgainLabel.isHidden = false
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton?) {
        if usernameLabel.text == "" || passwordLabel.text == "" {
            incorrectLabel.isHidden = false
        } else {
            nameForProfile = usernameLabel.text!
            performSegue(withIdentifier: "UnwindFromLogin", sender: nil)
        }
    }
    
    @IBAction func loginEnterKey(_ sender: UITextField) {
        loginButtonPressed(nil)
    }
    
    @IBAction func passwordEnterKey(_ sender: UITextField) {
        loginButtonPressed(nil)
    }
    
    
}
