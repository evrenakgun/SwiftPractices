//
//  ViewController.swift
//  UserDefault
//
//  Created by Evren Akgün on 7.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textFieldNote: UITextField!
    @IBOutlet weak var textFieldTime: UITextField!
    @IBOutlet weak var labelNote: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let savedNote = UserDefaults.standard.object(forKey: "not")
        let savedTime = UserDefaults.standard.object(forKey: "zaman")
        
        // as -> casting
        if let takenNote = savedNote as? String {
            labelNote.text = "Yapılacak İş: \(takenNote)"
        }
        
        if let takenTime = savedTime as? String {
            labelTime.text = "Yapılacak Zaman: \(takenTime)"
        }
    }

    @IBAction func buttonSave(_ sender: Any) {
        UserDefaults.standard.set(textFieldNote.text!, forKey: "not")
        UserDefaults.standard.set(textFieldTime.text!, forKey: "zaman")
        
        labelNote.text = "Yapılacak İş: \(textFieldNote.text!)"
        labelTime.text = "Yapılacak Zaman: \(textFieldTime.text!)"
        
        labelMessage.text = "Yapılacak iş ve zaman eklendi."
    }
    
    @IBAction func buttonDelete(_ sender: Any) {
        let savedNote = UserDefaults.standard.object(forKey: "not")
        let savedTime = UserDefaults.standard.object(forKey: "zaman")
        
        if (savedNote as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "not")
            labelNote.text = "Yapılacak İş: "
        }
        
        if (savedTime as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "zaman")
            labelTime.text = "Yapılacak Zaman: "
        }
        
        labelMessage.text = "Girdiler silindi."
    }
    
}

