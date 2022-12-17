//
//  ViewController.swift
//  SuperHeroBook
//
//  Created by Evren Akgün on 13.12.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var superHeroNames = [String]()
    var superHeroImageNames = [String]()
    
    var choosenName = ""
    var choosenImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        superHeroNames.append("Batman")
        superHeroNames.append("Captain America")
        superHeroNames.append("Iron Man")
        superHeroNames.append("Spider-Man")
        superHeroNames.append("Superman")
        
        //var superHeroImages = [UIImage]()
        //superHeroImages.append(UIImage(named: "batman")!)
        
        superHeroImageNames.append("batman")
        superHeroImageNames.append("captainAmerica")
        superHeroImageNames.append("ironman")
        superHeroImageNames.append("spiderman")
        superHeroImageNames.append("superman")
        
    }
    
    //numberOfRowsInSection: Bir sayfada kaç satır gösterilecek.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroNames.count
    }
    
    //cellForRow: Hücrenin içerisinde neler gösterilecek.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superHeroNames[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            superHeroImageNames.remove(at: indexPath.row)
            superHeroNames.remove(at: indexPath.row)
            //indexPath.row ile kullanıcının seçtiği satırın indexini belirtirsin.
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenName = superHeroNames[indexPath.row]
        choosenImage = superHeroImageNames[indexPath.row]
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.choosenHeroName = choosenName
            destinationVC.choosenHeroImageName = choosenImage
        }
    }

}

