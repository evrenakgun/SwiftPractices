//
//  ViewController.swift
//  LayoutProject
//
//  Created by Evren Akgün on 6.12.2022.
//

import UIKit

class ViewController: UIViewController {

    var myVariable = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var myVariable = 2
        print(myVariable)
        print(self.myVariable)
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        //Label
        let myLabel = UILabel()
        myLabel.text = "Test Label"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: width * 0.5 - width * 0.8 / 2, y: height * 0.5 - height * 0.9 / 2, width: width * 0.8, height: height * 0.9)
        view.addSubview(myLabel)
        
        //Button
        let myButton = UIButton()
        myButton.setTitle("Benim Buton", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.green, for: UIControl.State.normal)
        myButton.frame = CGRect(x: width * 0.5 - 100, y: height * 0.65, width: 200, height: 100)
        view.addSubview(myButton)
        
        myButton.addTarget(self, action: #selector(ViewController.myFunction), for: UIControl.Event.touchUpInside)
        
    }
    
    @IBAction func myFunction(){ //@objc veya @IBAction yazarak addTarget fonksiyonundaki selector hatasının önüne geçebilirsin.
        print("kullanıcı butona tıkladı")
    }


}

