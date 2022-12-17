//
//  DetailsViewController.swift
//  SuperHeroBook
//
//  Created by Evren Akgün on 13.12.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelHeroName: UILabel!
    
    var choosenHeroName = ""
    var choosenHeroImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: choosenHeroImageName)
        labelHeroName.text = choosenHeroName
    }
    
    

}
