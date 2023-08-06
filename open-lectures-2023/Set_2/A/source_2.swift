// A. Повторяющееся число

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (firstLine[0], firstLine[1])
let values = readLine()!.split(separator: " ").map { Int($0)! }

enum Answer: String, CustomStringConvertible {
    case yes = "YES"
    case no = "NO"
    
    var description: String {
        rawValue
    }
}

func isRepeatSomeValueSet(in values: [Int], distance: Int) -> Answer {
    var distanceWindow = Set<Int>()
    
    for (index, value) in values.enumerated() {
        let isInserted = distanceWindow.insert(value).inserted
        if !isInserted {
            return .yes
        }
        if index >= distance {
            distanceWindow.remove(values[index - distance])
        }
    }
    
    return .no
}

print(isRepeatSomeValueSet(in: values, distance: k))