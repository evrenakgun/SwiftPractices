//
//  ViewController.swift
//  AlertMessages
//
//  Created by Evren Akgün on 7.12.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldPassword2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonSignUp(_ sender: Any) {
        if textFieldEmail.text == "" {
            //email boş bırakılmışsa
            popUpWindow(titleMessage: "Hata!", mainMessage: "Email girilmedi!")
        }
        else if textFieldPassword.text == "" {
            //parola girilmemişse
            popUpWindow(titleMessage: "Hata!", mainMessage: "Parola girilmedi!")
        }
        else if textFieldPassword.text != textFieldPassword2.text {
            //parolalar uyuşmuyorsa
            popUpWindow(titleMessage: "Hata!", mainMessage: "Parolalar uyuşmuyor!")
        }
        else {
            //başarılı kayıtsa
            popUpWindow(titleMessage: "Başarılı!", mainMessage: "Kayıt oluşturuldu!")
        }
        
    }
    
    func popUpWindow (titleMessage : String, mainMessage : String) {
        let alertMessage = UIAlertController(title: titleMessage, message: mainMessage, preferredStyle: UIAlertController.Style.alert)
        let okayButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
            // OK Butonuna tıklanınca olacak şeyler yazılır.
            print("OK butonuna tıklandı.")
        }
        
        alertMessage.addAction(okayButton)
        
        self.present(alertMessage, animated: true, completion: nil)
    }
    
}

