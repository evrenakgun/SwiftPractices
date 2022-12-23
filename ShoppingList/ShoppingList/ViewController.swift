//
//  ViewController.swift
//  ShoppingList
//
//  Created by Evren Akgün on 23.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton))
    }
    
    @objc func addButton() {
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }

}

