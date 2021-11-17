import UIKit
import Foundation

var greeting = "Hello, playground"

//Default values of parameters

func printTables (number: Int, end : Int = 10) {
    print("Table of \(number)")
    print("===============")
    for i in 1 ... end {
        print("\(number)x\(i) = \(number*i)")
        
    }
}
printTables(number: 9, end: 15)
printTables(number: 13)


//Handle errors in functions

enum passwordError : Error {
    case short, obvious
}

func checkPassword(password: String) throws -> String {
    if password.count < 5 { throw passwordError.short}
    if password == "password " { throw passwordError.obvious}
    
    return "Password is set"
}


do {
    let result = try checkPassword(password: "")
    print(result)
} catch passwordError.obvious {
    print("Choose a different password")
} catch passwordError.short {
    print("Choose a longer password")
} catch {
    print("There was an error : \(error.localizedDescription)")
}

do {
    let tempString = "Hello World"
    let tempDataString = tempString.data(using: .utf8)!
    let decoder = JSONDecoder()
    let dec = try decoder.decode(String.self, from: tempDataString)
    
}  catch {
    print("Caught error")
}

//Checkpoint 4
enum checkpointErrors : Error {
    case outOfBounds, noRoot
}

func giveSquareRoot(for number: Int) throws -> Int {
    var squaringTempNumber : Int = 1
    if number < 1 || number > 10_000 {
        throw checkpointErrors.outOfBounds
    }
    while squaringTempNumber <= 1000 {
        let tempStore = squaringTempNumber * squaringTempNumber
        if number == tempStore {
            return squaringTempNumber
        }
        squaringTempNumber += 1
    }
    throw checkpointErrors.noRoot
}

do {
    let checkNumber : Int = 5
    let result = try giveSquareRoot(for: checkNumber)
    print("Square root of \(checkNumber) is \(result)")
} catch checkpointErrors.outOfBounds {
        print("Error: Out of Bounds")
} catch checkpointErrors.noRoot {
    print("Error: No root")
} catch {
    print("Error: Unknown error")
}
