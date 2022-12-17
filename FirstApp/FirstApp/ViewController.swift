//
//  ViewController.swift
//  FirstApp
//
//  Created by Evren Akgün on 24.11.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblBenim: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnTiklandi(_ sender: Any) {
        
        lblBenim.text = "Evren Akgün"
        
    }
}

