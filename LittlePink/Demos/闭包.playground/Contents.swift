import UIKit

// MARK: 使用场景1--全局函数
let label: UILabel = {
    let label = UILabel()
    label.text = "123"
    return label
}()


let learn = { (lan: String) -> String in
    "学习\(lan)"
}

learn("swift")


// MARK: 使用场景2--嵌套函数
func codingSwift(day: Int, appName: () -> String){
    print("学习swift\(day)天,写了\(appName())App")
}

codingSwift(day: 40, appName: { ()-> String in
    "天气"
})

let appName = { () -> String in
    "Todos"
}

codingSwift(day: 60, appName: appName)

// MARK: - 简写方法1- 尾随闭包(闭包的简写)
codingSwift(day: 130) { () -> String in
    "音视频"
}

// MARK: - 简写方法2- 根据上下午推断类型
func codingSwift(day: Int, appName: String,res: (Int,String) -> String){
    print("学习Swift\(day)天,\(res(1,"Alamofire")),做成了\(appName)App")
}

codingSwift(day: 33, appName: "天气") { takeDay, use in
    "花了\(takeDay)天,使用了\(use)技术"
}

// MARK: - 系统函数案例 --sorted
let arr = [3, 5, 2, 1, 4]

let sortedArr = arr.sorted(by: <)


// MARK: - 闭包捕获
func makeIncrementer(forIncrement amount: Int) -> () -> Int{
    var runningTotal = 0
    
    let incrementer = { () -> Int in
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)

incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementByTen()
// MARK: - 闭包是引用类型
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
incrementByTen()


// MARK: - 逃逸闭包
var completionHanlders: [() -> ()] = []
func someFunctionWithEscapingClosure(completionHanlder: @escaping () -> Void){
    completionHanlders.append(completionHanlder)
}

class SomeVC{
    func getData(finished: @escaping (String) -> ()){
        print("外层函数开始执行")
        DispatchQueue.global().async {
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                finished("数据回来了")
            }
        }
        print("外层函数执行结束")
    }
}

let someVC = SomeVC()
someVC.getData { data in
    print("执行了闭包,拿到了数据--\(data)")
}

