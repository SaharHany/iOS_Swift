import Foundation

func calMinAndMax(arr: [Int]) -> (Int,Int) { // ([Int])->(Int,Int) 
    var min : Int = arr[0]
    var max : Int = arr[0]

    for element in arr[1..<arr.count]{
        if element > max {
            max = element
        }else if element < min {
            min = element
        }
    }
    return (min,max)
}

var testArr : [Int] = [4,8,3,2,7,1]

var result : (Int,Int) = calMinAndMax(arr:testArr)

print("TestArr : ")
for i in testArr[0..<testArr.count]{
    print(i,terminator:" ")
}

print("")

print("min val = \(result.0) and max val = \(result.1)")