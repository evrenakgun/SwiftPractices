//
//  UserStruct.swift
//  AdvancedSwift
//
//  Created by Evren Akgün on 9.03.2023.
//

import Foundation

struct UserStruct {
    var name : String
    var age : Int
    var job : String
    
    // mutating yapmadın mı değiştiremezsin.
    mutating func increaseAge() {
        self.age += 1
    }
}
