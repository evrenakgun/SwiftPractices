//
//  ViewController.swift
//  PhotoSharingApp
//
//  Created by Evren Akgün on 21.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginTapped(_ sender: Any) {
        
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        performSegue(withIdentifier: "toFeedVC", sender: nil)
    }
}

