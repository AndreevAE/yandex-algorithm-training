// 26. Самый дешевый путь

let line = readLine()!.split(separator: " ")
let N = Int(line[0])!
let M = Int(line[1])!
var kgs = [Int]()
kgs.reserveCapacity(N * M)
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
        dp[i * M + j] = min(dp[(i - 1) * M + j], dp[i * M + (j - 1)]) + kgs[i * M + j]
    }
}

print(dp.last!)