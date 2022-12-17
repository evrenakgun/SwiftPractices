//
//  ViewController.swift
//  JestRecognizers
//
//  Created by Evren Akgün on 11.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelCity: UILabel!
    
    var istanbulImage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func changeImage() {
        if istanbulImage == false {
            imageView.image = UIImage(named: "istanbul")
            labelCity.text = "İstanbul"
            istanbulImage = true
        }
        else {
            imageView.image = UIImage(named: "kocaeli")
            labelCity.text = "Kocaeli"
            istanbulImage = false
        }
        
    }

}

