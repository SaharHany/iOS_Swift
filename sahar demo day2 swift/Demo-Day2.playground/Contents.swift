import UIKit

var str = "Hello, playground"

struct MyStruct{
    var name : String
    var title :String
    var age : Float
    
/*    var myObserver: Int = 0{
        willSet(myNewVal){
            print("about to change ",myNewVal)
        }
        didSet{
            print(oldValue)
        }
    }*/
}

class ClassA{
    var name : String = ""
    var title :String = ""
    var age : Float = 0.0
    
    var myArr = [1,2,3,4,5,6,7,8,9,10]
    
    subscript(index: Int)->Int{
        //we can remove get and set and just return myArr[index]
        get{
            return myArr[index]
        }
        set(myNewValue){
            myArr[index] = myNewValue
        }
    }
}

var objStruct = MyStruct(name: "Sahar", title: "myTitle", age: 22.0)

var objClass = ClassA()

var tuble :(x:Double,y:Double) = (x:2.0,y:3.0)

print(tuble.x)
print(tuble.y)

//////////////////


var myObserver: Int = 0{
    willSet(myNewVal){
        print("about to change ",myNewVal)
    }
    didSet(myOldVal){
     //   print("old value = ",oldValue) //hna lw ana m4 7ata didSet(myOldVal) fa el keyword el built-in hya oldValue
        print("old value = ",myOldVal)

        print("new value = ",myObserver)

    }
}

myObserver = 10
print(myObserver)


