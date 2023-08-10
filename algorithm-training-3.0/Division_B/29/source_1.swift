// 29. Кафе

let N = Int(readLine()!)! // 0 <= N <= 100
let N_1 = N + 1
var costs = [Int]()
costs.reserveCapacity(N_1)
costs.append(0)
for _ in 0..<N {
    let cost = Int(readLine()!)! // 0 <= cost <= 300
    costs.append(cost)
}
let maximumSumOfCosts = 300 * 100
var sums = [Int](repeating: maximumSumOfCosts + 1, count: N_1 * N_1)
sums[0] = 0

if N_1 > 1 {
    for j in 1..<N_1 { // days
        for i in 0...j { // coupons
            var variants = [Int]()
            if costs[j] > 100 {
                if i - 1 >= 0 {
                    variants.append(sums[(i - 1) * N_1 + (j - 1)] + costs[j])
                }
            } else {
                variants.append(sums[i * N_1 + (j - 1)] + costs[j])
            }
            if (i + 1) < N_1 && costs[j] > 0 {
                variants.append(sums[(i + 1) * N_1 + (j - 1)])
            }
            let minimum = variants.min()!
            sums[i * N_1 + j] = minimum
        }
    }
}

var K1 = 0
var minimum = maximumSumOfCosts
for i in 0..<N_1 {
    let sum = sums[i * N_1 + (N_1 - 1)]
    if minimum > sum {
        minimum = sum
        K1 = i
    }
}
print(minimum)

var reversedPath = [Int]()
reversedPath.reserveCapacity(N_1)

var k = K1
var K2 = 0
for j in stride(from: N_1 - 1, to: 0, by: -1) {
    let sumAtJ = sums[k * N_1 + j]
    
    if (k - 1) >= 0 && sumAtJ == sums[(k - 1) * N_1 + (j - 1)] + costs[j] {
        k -= 1
    } else if sumAtJ == sums[k * N_1 + (j - 1)] + costs[j] {
        // 
    } else if (k + 1) < N_1 && sumAtJ == sums[(k + 1) * N_1 + (j - 1)] {
        k += 1
        K2 += 1
        reversedPath.append(j)
    }
}

print(K1, K2)
reversedPath.reversed().forEach { print($0) }