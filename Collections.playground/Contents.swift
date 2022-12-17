import UIKit

// Collections (Koleksiyonlar)

var firstArray = ["Atıl", "Zeynep", "Atlas", "Mehmet", "Hülya"]

//index

firstArray[4].uppercased() // string tipinde bir dizi olduğu için string opsiyonlarını kullanabiliriz.

firstArray[2] = "Osman"
firstArray[2]

var secondArray = [10, 20, 30, 40]

secondArray[1] * 5 / 10

var mixedArray = [100, 200, "Atıl", true, false] as [Any] //Any dizilerine herhangi bir veri tipi koyabilirsin.

mixedArray[2] // karışık bir dizi olduğu için çağırdığımız elemanın string olduğunu anlayamıyor ve .uppercased gibi metotları kullanamıyoruz.

// Ancak çağırdığımız dizi elemanını yeni bir string değişkenine atarsak string metotlarını kullanabiliriz.
var newVariable = mixedArray[2] as! String // Ünlem kullanmanın amacı "ben bu işlemin çalışacağından eminim, sen yine de çalıştır bunu" demek
newVariable.uppercased()

mixedArray.append("Zeynep") // Dizinin sonuna eleman ekler

mixedArray.count // Dizinin kaç elemanı olduğunu söyler

mixedArray[mixedArray.count - 2]

mixedArray.last // Dizinin son elemanını verir

var numberArray = [5, 2, 1, 6, 9, 10]
numberArray.sort() // Diziyi küçükten büyüğe sıralar

var charArray = ["a", "j", "b", "o", "d"]
charArray.sort()


//Set

var numbers = [1, 1, 1, 1, 2, 3, 4, 5, 6]

var numberSet : Set = [1, 1, 1, 1, 2, 3, 4, 5, 6] // Dizideki benzersiz elemanları gösterir.

numberSet.remove(3)
numberSet

var ordersArray = ["Istanbul", "Istanbul", "Istanbul", "Ankara", "Adana"]

ordersArray.count

var ordersSet = Set(ordersArray)
ordersSet.count

let firstSet : Set = [40, 50, 60]
let secondSet : Set = [50, 60, 70]

let unionSet = firstSet.union(secondSet)


//Dictionary

// key-value pairing (anahtar kelime-değer eşleşmesi)
let fruitArray = ["Armut", "Muz", "Elma", "Karpuz"]
let caloriArray = [100, 150, 120, 300]

fruitArray[2]
caloriArray[2]

var fruitCaloriDictionary = ["Armut" : 100, "Muz" : 150, "Elma" : 120, "Karpuz" : 300]

fruitCaloriDictionary["Armut"]
fruitCaloriDictionary.keys
fruitCaloriDictionary.values

fruitCaloriDictionary["Muz"] = 200

var newDictionary = [20 : 30.2, 30 : 40.4] // her tipi başka bir tipe eşleştirebiliyorsun.
