// C. Носки

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let (L, N, M) = (firstLine[0], firstLine[1], firstLine[2])

var balance = Array(repeating: 0, count: L + 1)

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (l, r) = (line[0], line[1])
    balance[l - 1] += 1
    balance[r] -= 1
}

var sum = 0
var layers = Array(repeating: 0, count: L + 1)
for i in 0...L {
    sum += balance[i]
    layers[i] = sum
}

for _ in 0..<M {
    let query = Int(readLine()!)! - 1
    print(layers[query])
}