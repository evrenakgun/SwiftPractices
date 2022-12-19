//
//  main.swift
//  SwiftOOP
//
//  Created by Evren Akgün on 17.12.2022.
//

import Foundation

let user = User(name: "Atıl", age: 50, job: "Yazılım", type: .UserAdmin)
print(user.job)
user.job = "Eğitmen"
print(user.job)

user.exampleFunction()
print(user.seeHairColor())

print(user.type)

let user2 = PrivateUser(name: "Zeynep", age: 70, job: "Öğretmen", type: .UserNormal)

print(user2.name)

user2.newFunction()
user2.exampleFunction()
