//
//  user.swift
//  SwiftOOP
//
//  Created by Evren Akgün on 17.12.2022.
//

import Foundation

class User {
    var name = ""
    var age = 0
    var job = ""
    
    
    //initializer
    init(name: String = "", age: Int = 0, job: String = "") {
        print("init çağırıldı")
        self.name = name
        self.age = age
        self.job = job
    }
    
}
