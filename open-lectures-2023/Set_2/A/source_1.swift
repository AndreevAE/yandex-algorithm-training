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

func isRepeatSomeValue(in values: [Int], distance: Int) -> Answer {
    var valueIndicies = [Int: Int]()
    
    for (index, value) in values.enumerated() {
        if let prevIndex = valueIndicies[value], 
           index - prevIndex <= k {
            return .yes
        }
        
        valueIndicies[value] = index
    }
    
    return .no
}

print(isRepeatSomeValue(in: values, distance: k))