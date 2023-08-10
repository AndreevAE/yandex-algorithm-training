// 14. Сортировка вагонов lite

enum Answer: String, CustomStringConvertible {
        case yes
        case no
        
        var description: String {
            rawValue.uppercased()
        }
    }

_ = Int(readLine()!)!
var way1 = Array(readLine()!.split(separator: " ").map { Int($0)! }.reversed())
var siding = [Int]()
var current = 1

while let lastWay1 = way1.popLast() {
    if lastWay1 == current {
        current += 1
        
        while let lastSiding = siding.last, lastSiding == current {
            current += 1
            siding.popLast()
        }
    } else {
        siding.append(lastWay1)
    }
}

let answer = siding.isEmpty ? Answer.yes : .no
print(answer)