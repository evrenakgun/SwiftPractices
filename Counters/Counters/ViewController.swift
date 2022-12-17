//
//  ViewController.swift
//  Counters
//
//  Created by Evren Akgün on 11.12.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelTime: UILabel!
    
    var timer = Timer()
    var timeLeft = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLeft = 5
        
        labelTime.text = "Zaman: \(timeLeft)"
        
        
    }

    @IBAction func buttonStartAction(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunction() {
        labelTime.text = "Zaman: \(timeLeft)"
        timeLeft -= 1
        
        if timeLeft == 0 {
            labelTime.text = "Zaman: \(timeLeft)"
            timer.invalidate()
        }
    }
    
    @IBAction func buttonResetAction(_ sender: Any) {
        timeLeft = 5
        labelTime.text = "Zaman: \(timeLeft)"
    }
}

