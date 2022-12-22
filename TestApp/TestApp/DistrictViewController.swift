//
//  DistrictViewController.swift
//  TestApp
//
//  Created by Evren Akgün on 22.12.2022.
//

import UIKit

class DistrictViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var districtTableView: UITableView!
    
    var districtsArray = [Districts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        districtTableView.delegate = self
        districtTableView.dataSource = self
        
        districtManager()
    }
    
    func districtManager() {
        let kadikoy = Districts(name: "Kadıköy")
        
        districtsArray.append(kadikoy)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return districtsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = districtsArray[indexPath.row].name
        
        return cell
    }
    
    
}
