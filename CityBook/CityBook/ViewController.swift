//
//  ViewController.swift
//  CityBook
//
//  Created by Evren Akgün on 19.12.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var cityArr = [City]()
    var userChoice : City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Şehirler
        let antalya = City(name: "Antalya", region: "Akdeniz", image: UIImage(named: "antalya")!)
        let diyarbakir = City(name: "Diyarbakır", region: "Güneydoğu Anadolu", image: UIImage(named: "diyarbakir")!)
        let istanbul = City(name: "İstanbul", region: "Marmara", image: UIImage(named: "istanbul")!)
        let izmir = City(name: "İzmir", region: "Ege", image: UIImage(named: "izmir")!)
        let kocaeli = City(name: "Kocaeli", region: "Marmara", image: UIImage(named: "kocaeli")!)
        
        cityArr = [antalya, diyarbakir, istanbul, izmir, kocaeli]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = cityArr[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userChoice = cityArr[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.choosenCity = userChoice
        }
    }

}

