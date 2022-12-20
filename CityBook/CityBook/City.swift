//
//  City.swift
//  CityBook
//
//  Created by Evren Akgün on 20.12.2022.
//

import Foundation
import UIKit

class City {
    var name : String
    var region : String
    var image : UIImage
    
    init(name: String, region: String, image: UIImage) {
        self.name = name
        self.region = region
        self.image = image
    }
}
