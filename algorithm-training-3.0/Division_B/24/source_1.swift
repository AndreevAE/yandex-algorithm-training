// 24. Покупка билетов

let N = Int(readLine()!)!
var A = [Int](repeating: .max, count: N + 3)
var B = [Int](repeating: .max, count: N + 3)
var C = [Int](repeating: .max, count: N + 3)
var dp = [Int](repeating: 0, count: N + 3)

for i in 3..<N + 3 {
    let arr = readLine()!.split(separator: " ")
    let a = Int(arr[0])!
    A[i] = a
    let b = Int(arr[1])!
    B[i] = b
    let c = Int(arr[2])!
    C[i] = c
}

for i in 3..<N + 3 {
    dp[i] = min(dp[i - 1] + A[i], dp[i - 2] + B[i - 1], dp[i - 3] + C[i - 2])
}

print(dp.last!)