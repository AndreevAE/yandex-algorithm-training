// 5. Хорошая строка

let N = Int(readLine()!)!
var charsCount = Array<Int>()
charsCount.reserveCapacity(N)
var stringLength = 0

for _ in 0..<N {
    let c = Int(readLine()!)!
    charsCount.append(c)
    stringLength += c
}

let goodness = zip(charsCount.dropLast(), charsCount.dropFirst()).map { min($0, $1) }.reduce(0, +)
print(goodness)