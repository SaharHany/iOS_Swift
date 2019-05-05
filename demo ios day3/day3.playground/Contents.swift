import UIKit

var str = "Hello, playground"

var x = 10
print(x)

class Parent {

    var stored : Int = 0
    
    var myComputed : Double {
    get{
        return 5 * 6;
    }
    set{
        print("setted")
    }
   }
    var storedProp : Int = 7
    
    func sayHi() {
        print("Hiii Parent")
    }
    
    init() {
        print("Parent")
    }
}

class Child : Parent {
    
 /*   override var stored: Int{
        willSet{
            print("will setted")
        }
        didSet{
            print("did setted")
        }
    } */
    
    override var stored : Int {
        get{
            return 5*6
        }
        set{
            print("Setted")
        }
    }
    
    override var myComputed : Double {
        get{
            return 5 * 6;
        }
        set{
            print("setted")
        }
    }
    
    override var storedProp: Int {
        willSet{
         print("Will be setted")
        }
        didSet{
            print("setted")
        }
        
    }
    override func sayHi() {
        print("Hiii Child")
    }
    
    override init() {
        super.init()
        print("child")
    }
    
}

var obj = Parent()
print(obj.myComputed)
obj.myComputed = 10  //Cannot assign to property: 'myComputed' is a get-only property -- lw ana 4yla el set mn el computed property

var objC = Child()
objC.sayHi()

objC.storedProp = 7

///////////////

