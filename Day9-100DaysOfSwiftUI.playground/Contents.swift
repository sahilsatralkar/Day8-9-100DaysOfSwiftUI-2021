import UIKit

var greeting = "Hello, playground"
//Closures

let name = ["Rajeev","Abhinandan","Rakesh","Isha","Aparna","Rammohan","Athik"]

print(name.sorted())

func customSort(name1 : String, name2: String) -> Bool {
    if name1.count < name2.count {
        return true
    } else {
        return false
    }
}

print(name.sorted(by: customSort))

print(name.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1.count < name2.count {
        return true
    } else {
        return false
    }
}))

//trailing closure with shorthand
let reverseSort = name.sorted { $0 > $1 }

//accept parameters as functions
func makeArray (size : Int, using generator: () -> Int) -> [Int] {
    var tempArray = [Int]()
    
    for _ in 0 ... size {
        let number = generator()
        tempArray.append(number)
    }
    return tempArray
}

func generateRandomInt() -> Int {
    Int.random(in: 0 ... 10_000)
}
print (makeArray(size: 8) {
     Int.random(in: 0 ... 10_000)
})

let newArray = makeArray(size: 10, using: generateRandomInt)
print(newArray)


func doSomeWork (first: () -> Void, second: () -> Void, third: () ->Void ) {
    print("First is about to Start")
    first()
    print("Second is about to Start")
    second()
    print("Third is about to Start")
    third()
}

doSomeWork {
    print("This is First!")
} second: {
    print("This is Second!")
} third: {
    print("This is Third!")
}

//Checkpoint 5

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let resultArray = luckyNumbers.filter { number in
    if (number % 2 == 0) {
        return false
    }else {
        return true
    }
}.sorted {
    $0 < $1
}.map { number in
    return "\(number) is a lucky number"
}

print(resultArray)

for result in resultArray {
    print(result)
}

