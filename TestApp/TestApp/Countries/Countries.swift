//
//  Countries.swift
//  TestApp
//
//  Created by Evren Akgün on 26.12.2022.
//

import Foundation

class Countries {
    var id : UUID?
    var name : String
    
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
