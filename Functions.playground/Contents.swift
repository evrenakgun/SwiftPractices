import UIKit

func exampleFunction() {
    print("Örnek")
}

exampleFunction() //Fonksiyonu çalıştırır.

//Input & Parametre
func myFunction(a : String) {
    print(a)
}

myFunction(a: "Evren")

//Output, return

func addition(x : Int, y : Int) {
    print(x + y)
}

addition(x: 10, y: 20)

var num = addition(x: 20, y: 30)

print(num)

func multiplication(a : Int, b : Int) -> Int { // -> Int ifadesi bu fonksiyonun bir Int döndüreceğini belirtir.
    return a * b;
}

var resultMultiply = multiplication(a: 5, b: 8)
print(resultMultiply)

func logicFunction(x : Int, y : Int) -> Bool {
    if x > y {
        return true
    }
    return false
}

logicFunction(x: 1, y: 3)


//Optionals (Opsiyoneller)

var myName : String? // ?'nin anlamı; bu değişken bir değer alabilir de almayabilir de.

myName?.uppercased()

myName = "Evren"

myName?.uppercased()

var userNo = "10"
var userNo2 = "atıl"

// Force Unwrapping
var result = Int(userNo)! * 5 // ! işaretini eğer eminsek kullanırız.
// var result2 = Int(userNo2)! * 5 // Burada ünlem işareti bize fatal error verir. Çünkü userNo2 değişkeni metindir, integer'a çeviremeyiz.

var result2 = (Int(userNo) ?? 1) * 5 // userNo değişkenine bak eğer int'e çeviremiyorsan 1 değerini al.
var result3 = (Int(userNo2) ?? 1) * 5

// if let kullanımında; eğer ben sonucu int cinsinde tanımlayabiliyorsam bu işlemi yap.
if let result4 = Int(userNo2) {
    result4 * 5
}
else {
    print("Lütfen kelime veya harf girmeyin, sayı girin.")
}
