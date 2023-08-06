// E. Удаление чисел

let _ = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }

func deleteNumbers(from numbers: [Int]) -> Int {
    let counts = Dictionary(numbers.map { ($0, 1) }, uniquingKeysWith: +)
    var maximum = 0
    counts.keys.forEach { number in 
        maximum = max(
            maximum,
            counts[number, default: 0] + counts[number - 1, default: 0],
            counts[number, default: 0] + counts[number + 1, default: 0]
        )
    }
    
    return numbers.count - maximum
}

print(deleteNumbers(from: numbers))