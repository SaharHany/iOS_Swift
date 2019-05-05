import UIKit

var str = "Hello, playground"

enum EnumA : String{
    case case1="sahar", case2, case3
}

var obj = EnumA.case2
obj = .case1

print(obj)
print(obj.rawValue)
/////////////
//extension

extension String{
    func sayHi(){
        print("Hiii")
    }
}

var x : String = "Sahaaar"

x.sayHi()
