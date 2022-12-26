//
//  Districts.swift
//  TestApp
//
//  Created by Evren Akgün on 22.12.2022.
//

import Foundation
import UIKit

class Districts {
    var id : UUID?
    var name : String
    var cityId : String
    
    init(id: UUID? = nil, name: String, cityId: String) {
        self.id = id
        self.name = name
        self.cityId = cityId
    }
}
