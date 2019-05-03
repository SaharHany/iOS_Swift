import Foundation

func sortArray(  arr : [Int])->[Int] { // ([Int]) -> [Int]
  var i : Int = 0
  var n : Int = arr.count
  var swapped : Bool = true 
  var sorted : [Int] = arr

   while i<n-1 && swapped==true {
       swapped = false 
        for j in 0..<n-i-1{
            if sorted[j]>sorted[j+1]{
                var temp :Int = sorted[j]
                sorted[j] = sorted[j+1]
                sorted[j+1] = temp 
                swapped = true
            }
         }
   }
   return sorted
}

var myArr : [Int] = [5,2,4,3,1]
var mySortedArr : [Int] = sortArray(arr:myArr)

for k in mySortedArr[0..<mySortedArr.count]{
    print(k)
}