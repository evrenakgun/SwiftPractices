import UIKit

//Loops (Döngüler)

//While Loop

5 == 5
5 == 4
5 != 4

3 < 9
3 <= 3
2 > 1
2 >= 2

var x = 0

x += 1

x = 0

print("Döngü başladı.")
while x <= 10 {
    print(x)
    x += 1
}
print("Döngü bitti.")


//For Loop

var nameArray = ["Atıl", "Mahmut", "Mehmet", "Zeynep"]

for name in nameArray {
    print(name.uppercased())
}

var numberArray = [10,20,30,40,50,60,70,80,90]
numberArray[0] / 5 * 3

for num in numberArray {
    print(num / 5 * 3)
}

for newNum in 1 ... 10 {
    print(newNum)
}

// If Statements (Eğer kontrolleri)

3 == 3 && 4 == 4
3 != 3 && 4 == 4
3 != 3 || 4 == 4
3 != 3 || 4 != 4

var myAge = 50

if myAge < 20 {
    print("Çok gençsin.")
}
else if myAge >= 20 && myAge < 30 {
    print("Yirmili yaşlarındasın.")
}
else if myAge >= 30 && myAge < 40 {
    print("Otuzlu yaşlarındasın.")
}
else {
    print("Kırk yaşından büyüksün.")
}
