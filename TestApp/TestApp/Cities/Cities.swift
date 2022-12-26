//
//  Cities.swift
//  TestApp
//
//  Created by Evren Akgün on 22.12.2022.
//

import Foundation
import UIKit

class Cities {
    var id : UUID?
    var name : String
    var countryId : String
    
    init(id: UUID? = nil, name: String, countryId: String) {
        self.id = id
        self.name = name
        self.countryId = countryId
    }
}
