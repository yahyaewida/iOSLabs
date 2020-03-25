//: Playground - noun: a place where people can play

import UIKit

//////////////////////////////////////////////////////////////////////////////////////////
//factiorial

var number : Int32 = 5

func getFactorial (num : Int32) -> Int32{
    var result:Int32 = 1
    for i in 1...num {
        result *= i;
    }
    return result;
}

print("factorial of \(number) is \(getFactorial(num: number))")



//////////////////////////////////////////////////////////////////////////////////////////
//calcPowerIterative

var num1 : Int32 = 2
var pow1 : Int32 = 4

func calcPowerIterative(num1:Int32 , num2:Int32) -> Int32{
    
    var result : Int32 = 1
    for _ in 1...num2 {
        result *= num1;
    }
    return result;
}
print("calcPowerIterative of \(num1) ^ \(pow1) is \(calcPowerIterative(num1:num1,num2:pow1))")

//////////////////////////////////////////////////////////////////////////////////////////
//calcPowerRecursive

var num2 : Double = 2
var pow2 : Double = -3

print("test")


func calcPowerRecursive (num1:Double , num2:Double) -> Double{
    
    if num2 == 1{
        return num1;
    }
    var returnValue : Double = 0
    returnValue = num2 > 0 ? num1 * calcPowerRecursive(num1: num1, num2: (num2 - 1) ) : 1.0/num1 * calcPowerRecursive(num1: num1, num2: (num2 + 1) )
    
    return returnValue;
    
}

print("calcPowerRecursive of \(num2) ^ \(pow2) is \(calcPowerRecursive(num1:num2,num2:pow2))")



var array : [Int] = [-100,2,31,54,0]


//////////////////////////////////////////////////////////////////////////////////////////
//calcMinMax

func calcMinMax ( array : [Int]) -> (min :Int,max:Int){
    var minimum = array[0] , maximum = array[0]
    
    for i in 0...array.count-1{
        if array[i] < minimum{
            minimum = array[i]
        }
        if array[i] > maximum{
            maximum = array[i]
        }
    }
    
    return (min:minimum,max:maximum)
}



print("calcMinMax of array :  \(calcMinMax(array:array))")



//////////////////////////////////////////////////////////////////////////////////////////
//swap
var swap1 = 5 , swap2 = 10
func swapNumbers ( num1: inout Int , num2: inout Int){
    var temp:Int = num1
    num1 = num2
    num2 = temp
    
}
print("swapNumbers of swap1,swap2 :  \(swap1) , \(swap2)")
swapNumbers(num1: &swap1, num2: &swap2)
print("after swapNumbers of swap1,swap2 :  \(swap1) , \(swap2)")

//////////////////////////////////////////////////////////////////////////////////////////
//sortArray

func sortArray (array : inout [Int]) {
    
    for i in 0...array.count-1{
        for j in i...array.count-1{
            if array[j] < array[i]{
                var temp:Int = array[i]
                array[i] = array[j]
                array[j] = temp
            }
        }
    }
}
sortArray(array: &array)
for i in 0...array.count-1{
    print(array[i])
}



