//
//  UserClass.swift
//  AdvancedSwift
//
//  Created by Evren Akgün on 9.03.2023.
//

import Foundation

class UserClass {
    var name : String
    var age : Int
    var job : String
    
    init(name: String, age: Int, job: String) {
        self.name = name
        self.age = age
        self.job = job
    }
    
    func increaseAge() {
        self.age += 1
    }
    
}
