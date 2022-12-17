//
//  SecondViewController.swift
//  ViewControllerProject
//
//  Created by Evren Akgün on 6.12.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var checkPasswordLabel: UILabel!
    
    var givenPassword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checkPasswordLabel.text = givenPassword
    }
    
    

}
