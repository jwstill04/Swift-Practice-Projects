//
//  ProfileViewController.swift
//  Sleep Tracker
//
//  Created by cmh-bstudent on 2/1/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Signed out"
        titleLabel.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        if nameForProfile != "" {
            updateTitle()
        }
    }
    
    func updateTitle() {
        titleLabel.isHidden = false
        navigationItem.title = "Hello, \(nameForProfile)!"
    }
    
    

}
