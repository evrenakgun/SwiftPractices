//
//  user.swift
//  SwiftOOP
//
//  Created by Evren Akgün on 17.12.2022.
//

import Foundation

enum UserType {
    case UserAdmin
    case UserNormal
    case UserUnauthorized
}

class User {
    var name : String
    var age : Int
    var job : String
    var type : UserType
    private var gender : String = "" // Eğer değişkeni initializer içinde tanımlamazsan bir değer atamak zorundasın.
    private var hairColor : String = "Siyah"
    
    //initializer
    init(name: String, age: Int, job: String, type: UserType) {
        print("init çağırıldı")
        self.name = name
        self.age = age
        self.job = job
        self.type = type
    }
    
    func exampleFunction() {
        print("örnek fonksiyon çalıştırıldı")
    }
    
    private func testFunction() {
        print("test")
    }
    
    //**** Access Levels ****
    //open, public, internal, fileprivate, private
    
    func seeHairColor() -> String {
        return self.hairColor
    }
    
}
