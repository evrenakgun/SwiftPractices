//
//  main.swift
//  AdvancedSwift
//
//  Created by Evren Akgün on 9.03.2023.
//

import Foundation

// Struct -> inheritance yok, stack - filo(first in last out), daha hızlı ve daha basit, value type, immutable.
// Class -> inheritance var, heap - fifo(first in first out), reference type, mutable, objective-c ile de kullanılabilir.

let evrenClass = UserClass(name: "Evren", age: 28, job: "Yok")
var evrenStruct = UserStruct(name: "Evren", age: 28, job: "Yok")

//print(evren.name)
//print(ilayda.name)


//********************************************************

// Struct yapılar let ile tanımlanmış ise propertyleri bu şekilde değiştiremezsin.
evrenClass.age = 33
evrenStruct.age = 30

//print(evrenClass.age)
//print(evrenStruct.age)

// Referans ve Değer Tipi Farkı
let evrenClassCopy = evrenClass
var evrenStructCopy = evrenStruct

//print(evrenClassCopy.age)
//print(evrenStructCopy.age)

evrenStructCopy.age = 34
evrenClassCopy.age = 35

//print(evrenClassCopy.age)
//print(evrenStructCopy.age)
//
//print(evrenClass.age)
//print(evrenStruct.age)

// reference type -> class
// kopyalama yapıldığında tek bir obje var, 2 referans var

// value type -> struct
// kopyalama yapıldığında 2 obje var.

//print(evrenClass.age)

evrenClass.increaseAge()

//print(evrenClass.age)

//print(evrenStruct.age)

evrenStruct.increaseAge()

//print(evrenStruct.age)

//********************************************************

// Tuple
var myTuple = (10,20)

//print(myTuple.0)

var myTuple2 = (10,20,30,40)

//print(myTuple2.3)
myTuple2.3 = 50
//print(myTuple2.3)

let myTuple3 = ("Evren", 33)
//print(myTuple3.0)

let myTuple4 = ("Evren", [1,2,3,4])
//print(myTuple4.1[2])

let myNumber : Int?

let myBeforeTuple : (String, String)

myBeforeTuple.0 = "Evren"
myBeforeTuple.1 = "Akgün"

//print(myBeforeTuple)

let newTuple = (name: "Evren", surname: "Akgün")

//print(newTuple.name)

//********************************************************

// Guard Let
let numberString = "5"

func toIntIfLetFunc(string : String) -> Int {
    
    if let myInteger = Int(string) {
        return myInteger
    } else {
        return 0
    }
    
}

//print(toIntIfLetFunc(string: numberString))

func toIntGuardLetFunc(string : String) -> Int {
    // If let'ten farklı olarak else durumunu önden ister ve yapısı bu şekildedir.
    guard let myInteger = Int(string) else {
        return 0
    }
    return myInteger
}

//print(toIntGuardLetFunc(string: numberString))

//********************************************************

// Switch-Case
let dayNumber = 4
var dayString = ""

switch dayNumber {
case 1:
    dayString = "Pazartesi"
case 2:
    dayString = "Salı"
case 3:
    dayString = "Çarşamba"
default:
    dayString = "Pazar"
}

//print(dayString)
