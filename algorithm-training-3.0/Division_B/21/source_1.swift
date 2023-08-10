// 21. Три единицы подряд

let N = Int(readLine()!)!
    
var powerOf2 = 1 << 1
var countNot111 = [Int](repeating: 0, count: N + 1)
var count111 = [Int](repeating: 0, count: N + 1)
countNot111[1] = 2
if N > 1 {
    countNot111[2] = 4
    powerOf2 <<= 1
}
if N > 2 {
    countNot111[3] = 7
    count111[3] = 1
    powerOf2 <<= 1
}
if N > 3 {
    countNot111[4] = 13
    count111[4] = 3
    powerOf2 <<= 1
}

if N > 4 {
    for i in 5...N {
        count111[i] = count111[i - 1] * 2 + countNot111[i - 4]
        powerOf2 <<= 1
        countNot111[i] = powerOf2 - count111[i]
    }
}

print(countNot111[N])