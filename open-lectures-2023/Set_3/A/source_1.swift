// A. Количество положительных на отрезке

let _ = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var sum = 0
var prefixes = [0] + numbers
    .map { number in
        sum += number > 0 ? 1 : 0
        return sum
    }

let q = Int(readLine()!)!
for _ in 0..<q {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (l, r) = (line[0] - 1, line[1])
    print(prefixes[r] - prefixes[l])
}