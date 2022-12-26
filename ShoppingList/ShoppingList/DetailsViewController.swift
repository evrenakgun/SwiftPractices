//
//  DetailsViewController.swift
//  ShoppingList
//
//  Created by Evren Akgün on 23.12.2022.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var sizeTextField: UITextField!
    
    var selectedItemName = ""
    var selectedItemUUID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectedItemName != "" {
            //Core data seçilen ürün bilgilerini göster
            if let uuidString = selectedItemUUID?.uuidString {
                print(uuidString)
            }
            
        } else {
            nameTextField.text = ""
            priceTextField.text = ""
            sizeTextField.text = ""
        }

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageGestureRecognizer)
    }
    
    @objc func selectImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let shopping = NSEntityDescription.insertNewObject(forEntityName: "Shopping", into: context)
        
        shopping.setValue(nameTextField.text!, forKey: "name")
        shopping.setValue(sizeTextField.text!, forKey: "size")
        
        if let price = Int(priceTextField.text!) {
            shopping.setValue(price, forKey: "price")
        }
        
        //universal unique id
        shopping.setValue(UUID(), forKey: "id")
        
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        
        shopping.setValue(data, forKey: "image")
        
        do {
            try context.save()
            print("kayıt edildi")
        } catch {
            print("hata var")
        }
        
        //Diğer viewControllerlara veya herhangi bir yere yeni bir data kaydettiğinin haberini vermek için
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "sentData"), object: nil)
        //veri eklediğinde en başa dönmeyi sağlayan kod
        self.navigationController?.popViewController(animated: true)
    }
    
}
