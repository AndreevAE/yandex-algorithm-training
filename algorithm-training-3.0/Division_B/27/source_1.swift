// 27. Вывести маршрут максимальной стоимости

let line = readLine()!.split(separator: " ")
let N = Int(line[0])!
let M = Int(line[1])!

var kgs = [Int]()
for _ in 0..<N {
    let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    kgs.append(contentsOf: arr)
}

var dp = [Int](repeating: 0, count: N * M)
    dp[0] = kgs.first!
for j in 1..<M {
    dp[j] = dp[j - 1] + kgs[j]
}
for i in 1..<N {
    dp[i * M] = dp[(i - 1) * M] + kgs[i * M]
}
for i in 1..<N {
    for j in 1..<M {
        dp[i * M + j] = max(dp[(i - 1) * M + j], dp[i * M + (j - 1)]) + kgs[i * M + j]
    }
}

print(dp.last!)

let down = "D"
let right = "R"
var i = N - 1
var j = M - 1
var reversedPath = [String]()
reversedPath.reserveCapacity(N + M - 2)
while i > 0 && j > 0 {
    if dp[(i - 1) * M + j] > dp [i * M + (j - 1)] {
        reversedPath.append(down)
        i -= 1
    } else {
        reversedPath.append(right)
        j -= 1
    }
}
reversedPath.append(contentsOf: [String](repeating: down, count: i))
reversedPath.append(contentsOf: [String](repeating: right, count: j))

print(reversedPath.reversed().joined(separator: " "))