import UIKit

// MARK - 语法
enum CompassPoint {
    case north
    case south
    case east
    case west
}

var direction = CompassPoint.east
direction = .north

// MARK - 遍历
enum Beverage: CaseIterable {
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

for beverage in Beverage.allCases {
    print(beverage)
}

// MARK - 原始值 Raw Values

enum ASCIIControlCharacter: Character{
    case tab = "\t"
    case lineFead = "\n"
    case carriageReturn = "\r"
}

ASCIIControlCharacter.tab.rawValue

enum Planet: Int{
    case mercury = 1, venus, earth ,mars,jupiter
}
Planet.earth
Planet.earth.rawValue

enum CompassPointX: String{
    case north,south,east,west
}
CompassPointX.east.rawValue

Planet(rawValue: 2)

// MARK - 关联值 Associated Values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 8888, 18, 188)

productBarcode = .qrCode("aaa")
