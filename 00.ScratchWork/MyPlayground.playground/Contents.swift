//: Playground - noun: a place where people can play

import UIKit

/*
var str = "Hello, playground"

print (str)

var a: Double = 8.76

var b: Float = 99.99

var c = 7.7

print (a/c)

let gameOver = false

var gameOverString = String(gameOver)

var t: Double = 5.76

var q = 8

print(Double(q)+t)





var testArray = [1,2,2,3,3,]



print(testArray[2])

print(testArray.count)

testArray.append(10)

testArray.remove(at: 2)

testArray.sort()

//let mixedArray = ["Test",46,true]

let arrayString = [String]()




var testDictionary = ["comp":1, "test":2]

print(testDictionary["comp"]!)

print(testDictionary.count)

testDictionary["another"] = 3

print(testDictionary)

testDictionary.removeValue(forKey: "test")

print(testDictionary)



var challengeDictionary = ["Pizza":10.99,"Ice Cream":4.99, "Salad":7.99]

let k = challengeDictionary["Pizza"]! + challengeDictionary["Ice Cream"]!

print("The total cost of my meal is " + String(k))


print("The total cost of my meal is \(challengeDictionary["Pizza"]! + challengeDictionary["Salad"]!)")


let age = 13

if age >= 18 {
    print("You can play")
}else{
    print("You cannot play")
}


let username = "Me"
let password = 3

if username == "Me" && password == 3 {
    print("Access Granted")
}else if username != "Me"{
    
    print("Username is incorrect")
}else if password != 3{
    
    print("Password is incorrect")
}





//Looops

/*
var i = 7

while i <= 140{
    print  (i)
    i+=7
}

*/

/*
var i = 1

while i < 10{
    print (i)
    
    i+=1
}

*/
/*
var i = 7

while i<=140{
    print(i)
    i+=7
}


var array = [7,23,98,1,0,763]




var i = 0

while i < array.count {
    
    array[i] += 1
    
    i += 1
}

print(array)

*/

var array = ["bob","jane","t","mart"]

for name in array {
    
    print("Hi there \(name) ")
}
 

var numbers = [1,2,3,4]

for (index,value) in numbers.enumerated(){
    
    numbers[index] += 1
}

print(numbers)
 


var numbers = [Double]()
numbers = [8,7,19,28]

for (index,value) in numbers.enumerated(){
    
    numbers[index] = value/2
    
}



print(numbers)
 
 


class Ghost{
    
    var isAlive = true
    
    var strength = 9
    
    func kill(){
        isAlive = false
    }
    
    func isStrong() -> Bool {
        if strength > 10 {
            return true
        }else{
            return false
        }
    }
    
}

var ghost1 = Ghost()


print (ghost1.isAlive)

ghost1.strength = 20

print(ghost1.strength)

ghost1.kill()

print(ghost1.isAlive)

print(ghost1.isStrong())
 
  */


//Optionals allow us to use a variable without assigning an initial value
/*
var number: Int?

print(number)

let userEnteredText = "3"

let userEnteredInteger = Int(userEnteredText)

if let catAge = userEnteredInteger{
    print(catAge * 7)
}
*/

let number = 1

var isPrime = true
var i = 2

if number == 1{
    isPrime = false
}


while i < number {
    if number % i == 0{
        isPrime = false
    }
    i += 1
}

print(isPrime)




