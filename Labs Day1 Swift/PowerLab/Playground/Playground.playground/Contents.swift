import Foundation


func calcPowerRec(base:Int , power:Int)->Int {
    if power==0{
        return 1 
    }else{
        return base * calcPowerRec(base: base , power:power-1)
    }
}

func calcPowerLoop(base:Int , power:Int)->Int {
    var result :Int = 1
    for _ in 1...power{
        result = result * base
    } 
    return result 
}

var number : Int = 2
var pow : Int = 3
print("Loop: result = ",calcPowerLoop(base:number , power:pow))
print("Rec:  result = ",calcPowerRec(base:number , power:pow))