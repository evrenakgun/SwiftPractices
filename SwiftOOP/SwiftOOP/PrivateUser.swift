//
//  PrivateUser.swift
//  SwiftOOP
//
//  Created by Evren Akgün on 19.12.2022.
//

import Foundation

class PrivateUser : User{
    
    func newFunction() {
        print("Yeni fonskiyon çalıştırıldı")
    }
    
    override func exampleFunction() {
        super.exampleFunction()
        print("override örnek fonksiyon çalıştırıldı")
    }
}
