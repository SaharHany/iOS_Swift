import Foundation

func getFactorial(param  : Int) -> Int {// (Int) -> Int
    var fact : Int = 1
    var check0 : Bool = param == 0
    var check1 : Bool = param == 1

    if check0 || check1 {
        return fact
    }else{
       return  param * getFactorial(param:param-1)
    }
}

var number : Int = 5
var x = getFactorial(param:number)
print("fact of \(number) = ",x)