//
//  DetailsViewController.swift
//  CityBook
//
//  Created by Evren Akgün on 19.12.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityRegionLabel: UILabel!
    
    var choosenCity : City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cityNameLabel.text = choosenCity?.name
        cityRegionLabel.text = choosenCity?.region
        imageView.image = choosenCity?.image
    }
    
    

}
