import Foundation

func swap (num1 : inout Int , num2 : inout Int ) { //(Int,Int)->void
    var temp : Int = num1 
    num1 = num2
    num2 = temp
}

var x : Int = 3 
var y : Int = 4

print("Before Swapping x = \(x) and y = \(y)") 

swap(num1:&x,num2:&y)

print("After  Swapping x = \(x) and y = \(y)") 