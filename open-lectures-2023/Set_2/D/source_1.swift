// D. Majority

let _ = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }

func majority(of numbers: [Int]) -> Int {
    Dictionary(numbers.map { ($0, 1) }, uniquingKeysWith: +)
        .first(where: { $1 > numbers.count / 2 })?.key ?? 0
}

print(majority(of: numbers))