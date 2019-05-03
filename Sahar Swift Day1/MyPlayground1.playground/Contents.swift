import UIKit

var str = "Hello, playground"

print(str)

//let x :UInt = -1 //compile error

//let y : Int8 = Int8.max + 1  //compile error

var tuble = (9,"hello")

//var last = tuble.2  //compile error

tuble.0

var tuble2 = (("hii",9),"hello")

tuble2.0.0

var arr = ["0","1","2","3","4"]

arr[1...3] = ["5","6"]

for item in arr{

    print(item)

}

//print(arr[5])


let httpstatus2 = (code:200,msg:"ok")
print(httpstatus2.code)
print(httpstatus2.msg)


var val : Optional<Int> // <==> var val : Int? //of type optional Int

//print(val) // error Variable 'val' used before being initialized
//default value for optional variable or property is nil
print(val)

print("helloo",str)

var myOptional :Int? = 5 //wrapped

print(myOptional)

//we have to unwrap

//optional binding method - safe way unwrapping
if let myVal = myOptional {
    print(myVal)
}else{
    print("Cannot unwrap")
}

//forced unwrapping
print(myOptional!)

var myOptional2 :Int?

//print(myOptional2!) //Fatal error: Unexpectedly found nil while unwrapping an Optional value


//implicity unwrapped
var myImplicit : Int! = 7

print(myImplicit)

var myImplicit2 : Int = myImplicit

print(myImplicit2)



//functions
//_ m3naha en a3ml neglect lel external name fa m4 m7taga w2tha a3ml mention lel param name wna bb3to

//name hwaa el external w el param internal
//lakn lw m4 7ta external hib2a hwa el internal wl external
//el internal bst5dmha gwa el method wl external binade beha brh

func sayHello(fname param1:String , lname param2:String) -> String{ //(String,String)-> String
    print("Hello ya \(param1)",param2)
    return "Hiii"
}

print(sayHello(fname: "Sahar", lname: "Hany"))


func sayHello2(param:String) -> String{//(String) -> String
    print("Hello ya \(param)")
    return "Hiii"
}

print(sayHello2(param: "Sahar"))


func multiply (num1:Int , num2:Int)->Int{ //(Int,Int) -> Int
    return num1 * num2;
}

func myPrint(){ // () -> void
    
}

var myVar : (Int,Int) -> Int = multiply

print(myVar(5,6))
