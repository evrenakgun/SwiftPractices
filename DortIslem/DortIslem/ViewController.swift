//
//  ViewController.swift
//  DortIslem
//
//  Created by Evren Akgün on 5.12.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var result = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func additionButton(_ sender: Any) {
        
        if let firstNumber = Int(firstText.text!){
            if let secondNumber = Int(secondText.text!){
                result = firstNumber + secondNumber
                resultLabel.text = "Sonuç: " + String(result)
            }
            else {
                resultLabel.text = "Geçerli bir değer giriniz."
            }
        }
        
        else {
            resultLabel.text = "Geçerli bir değer giriniz."
        }
    }
    
    @IBAction func minusButton(_ sender: Any) {
        if let firstNumber = Int(firstText.text!){
            if let secondNumber = Int(secondText.text!){
                result = firstNumber - secondNumber
                resultLabel.text = "Sonuç: " + String(result)
            }
            else {
                resultLabel.text = "Geçerli bir değer giriniz."
            }
        }
        
        else {
            resultLabel.text = "Geçerli bir değer giriniz."
        }
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
        if let firstNumber = Int(firstText.text!){
            if let secondNumber = Int(secondText.text!){
                result = firstNumber * secondNumber
                resultLabel.text = "Sonuç: " + String(result)
            }
            else {
                resultLabel.text = "Geçerli bir değer giriniz."
            }
        }
        
        else {
            resultLabel.text = "Geçerli bir değer giriniz."
        }
    }
    
    @IBAction func divideButton(_ sender: Any) {
        if let firstNumber = Int(firstText.text!){
            if let secondNumber = Int(secondText.text!){
                result = firstNumber / secondNumber
                resultLabel.text = "Sonuç: " + String(result)
            }
            else {
                resultLabel.text = "Geçerli bir değer giriniz."
            }
        }
        
        else {
            resultLabel.text = "Geçerli bir değer giriniz."
        }
    }
    
}

