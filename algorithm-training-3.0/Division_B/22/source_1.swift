// 22. Кузнечик

let arr = readLine()!.split(separator: " ")
let N = Int(arr[0])!
let k = Int(arr[1])!

var dp = [Int](repeating: 0, count: N)
dp[0] = 1
for i in 1..<N {
    dp[i] = (max(0, (i - k))...i).map { dp[$0] }.reduce(0, +)
}
print(dp.last!)