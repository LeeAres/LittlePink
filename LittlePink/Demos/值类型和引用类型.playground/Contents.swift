import UIKit

//内存的两个分块:1.堆-heap  2.-stack
//指针 = 内存地址

struct Person{
    var name = "王哥"
    var age = 20

}

let p1 = Person()
var p2 = p1

p2.age = 10
p1.age

class PersonC{
    var name = "王哥"
    var age = 20
}

let p3 = PersonC()
let p4 = p3
p4.age = 30
p3.age
