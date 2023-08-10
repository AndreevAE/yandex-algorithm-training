// 23. Калькулятор

let N = Int(readLine()!)!

var minOperations = [Int](repeating: 0, count: N + 1)
var previousIndicies = [Int](repeating: 0, count: N + 1)
previousIndicies[1] = 1
if N > 1 {
    for i in 2...N {
        var curr = [i - 1]
        if i % 2 == 0 {
            curr.append(i / 2)
        }
        if i % 3 == 0 {
            curr.append(i / 3)
        }
        let (previousIndex, minimum): (Int, Int) = curr.map { ($0, minOperations[$0]) }.min(by: { $0.1 < $1.1 })!
        minOperations[i] = minimum + 1
        previousIndicies[i] = previousIndex
    }
}
print(minOperations.last!)

var index = N
var numbers = [N]
while index > 1 {
    numbers.append(previousIndicies[index])
    index = previousIndicies[index]
}
print(numbers.reversed().map { String($0) }.joined(separator: " "))