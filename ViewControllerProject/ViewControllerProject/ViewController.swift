//
//  ViewController.swift
//  ViewControllerProject
//
//  Created by Evren Akgün on 6.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var takenPassword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("view did disappear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        textField.text = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear")
    }
    
    @IBAction func checkButtonAction(_ sender: Any) {
        takenPassword = textField.text!
        
        if takenPassword == "evren" {
            performSegue(withIdentifier: "toSecondVC", sender: nil)
        }
        else {
            firstLabel.text = "Şifreniz yanlış"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let destinationSecondVC = segue.destination as! SecondViewController
            destinationSecondVC.givenPassword = takenPassword
        }
    }
    
}

