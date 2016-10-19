//: Playground - noun: a place where people can play

import UIKit

var str = "Hello"

var str2 = str + " Hi"

for character in str2.characters {
    print(character)
}

let newTypeString = NSString(string: str2)


newTypeString.substring(from: 5)

newTypeString.substring(to: 1)

NSString(string: newTypeString.substring(from: 3)).substring(to: 1)


newTypeString.substring(with: NSRange(location: 4, length: 3))

if newTypeString.contains("H"){
    print("String contains H")
}else{
    print("String does not contain H")
}

newTypeString.components(separatedBy: " ")


newTypeString.uppercased

newTypeString.lowercased
