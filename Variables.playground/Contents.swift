import UIKit

//String veri tipi
var name = "Evren"
var surname = "Akgün"

print(name)

name = "evren"

print(name)

var userName = "test" // camelCase
var user_name = "test2" // snake_case

userName.uppercased()
userName.append("1")
userName.count

// var değişken atar, let sabit atar.
// let sabitlerini değiştiremezsin.

//int
let myNumber = 50
myNumber.isMultiple(of: 2)

let firstNumber = 80
let secondNumber = 12

firstNumber / secondNumber

//Double
let pi = 3.14

let firstDoubleNumber = 80.0
let secondDoubleNumber = 12.0

firstDoubleNumber / secondDoubleNumber

//Boolean
var myBoolean = true
myBoolean = false

var number : Int32 = 50

let numberDouble : Float = 3.14

//defining, tanımlama
let myString : String

//initialization (değerini atama, başlatma)
myString = "Atıl" // let ile tanımlanan değeri sonradan değiştiremezsin program izin vermez.

var myNewNumber :Int

// myNewNumber = "Mahmut" --- Int olarak belirlediğin bir değişkene başka tipte bir değer atayamazsın.

myNewNumber = 20

let myStringNumber : String

myStringNumber = String(myNewNumber)

myStringNumber + "10"

let stringNo = "400"
let integerString = Int(stringNo)
//integerString! + 20
