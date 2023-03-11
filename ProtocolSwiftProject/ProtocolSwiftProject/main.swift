//
//  main.swift
//  ProtocolSwiftProject
//
//  Created by Evren Akgün on 10.03.2023.
//

import Foundation

protocol Running {
    func myRun()
}

class Animal {
    func test() {
        print("test")
    }
}

class Dog : Running {
    func myRun() {
        print("run dog run")
    }
}

let barley = Dog()
barley.myRun()

class Cat : Animal, Running {
    func myRun() {
        print("run cat run")
    }
}

let cat = Cat()
cat.test()
cat.myRun()

class Fish : Animal {
    
}

let nemo = Fish()


struct Bird : Running {
    func myRun() {
        print("run bird run")
    }
}

let tweety = Bird()
tweety.myRun()

