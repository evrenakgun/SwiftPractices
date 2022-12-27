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
    @IBOutlet weak var saveButtonOutlet: UIButton!
    
    var selectedItemName = ""
    var selectedItemUUID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectedItemName != "" {
            // Buton saklama
            saveButtonOutlet.isHidden = true
            
            //Core data seçilen ürün bilgilerini göster
            if let uuidString = selectedItemUUID?.uuidString {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let context = appDelegate.persistentContainer.viewContext
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Shopping")
                // predicate komutu ile sadece tablodan seçilen id'nin altındaki ürün özelliklerini listelemesini sağlıyoruz.
                // "id = %@" id şuna eşit olanları getir demektir.
                fetchRequest.predicate = NSPredicate(format: "id = %@", uuidString)
                fetchRequest.returnsObjectsAsFaults = false
                
                do {
                    let results = try context.fetch(fetchRequest)
                    
                    if results.count > 0 {
                        for result in results as! [NSManagedObject] {
                            if let name = result.value(forKey: "name") as? String {
                                nameTextField.text = name
                            }
                            
                            if let price = result.value(forKey: "price") as? Int {
                                priceTextField.text = String(price)
                            }
                            
                            if let size = result.value(forKey: "size") as? String {
                                sizeTextField.text = size
                            }
                            
                            if let imageData = result.value(forKey: "image") as? Data {
                                let image = UIImage(data: imageData)
                                imageView.image = image
                            }
                        }
                    }
                } catch {
                    print("hata var")
                }
            }
            
        } else {
            saveButtonOutlet.isHidden = false
            saveButtonOutlet.isEnabled = false // butonu tıklanamaz hale getirir.
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
        saveButtonOutlet.isEnabled = true
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        
        //veritabanına kayıt işlemi
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
