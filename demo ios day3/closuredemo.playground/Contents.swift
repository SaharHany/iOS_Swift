import UIKit

var str = "Hello, playground"
var strArr = ["Sahar"  , "Amr", "Esraa"]
strArr.sort { $0 < $1 } // can omit return // can omit datatype of elements

//strArr.sort { (s1:String, s2:String) -> Bool in
  //  return s1<s2
//}

print(strArr)

//////
//protocol is a blueprint of methods
//swift karemaa
protocol myProtocol : extra{
    var firstName : String{get} //constant -- constant has get only
    var lastName :String{get set} //stored property
    var fullName : String{get set} //computed property
    var id : Int {get} //here is readonly and can be readwrite in the conforming struct/class --   //but not viceversa
    
    func instanceMeth () -> String
    static func myStaticMeth ()
    
}


protocol extra{
    func method2()
}

//struct and class can conform protocol
struct MyStruct : myProtocol {
    func method2() {
        print("Extra")
    }
    
    func instanceMeth() -> String {
        return  "instance Method"
    }
    
    static func myStaticMeth() {
        print("Static Method")
    }
    
    
    
    let firstName: String = "Sahar"
    
    var lastName: String = "Hany"
    
    var fullName: String{
        get{
            return firstName + lastName
        }
        set{
            print("setted")
        }
    }

    var id: Int {
        get {
            return 30
        }
        set{
            print("setted")
        }
    }
    
    
}


var obj = MyStruct()
print(obj.instanceMeth())

MyStruct.myStaticMeth()
obj.method2()
