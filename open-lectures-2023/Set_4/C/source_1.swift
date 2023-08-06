// C. Носки

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let (L, N, M) = (firstLine[0], firstLine[1], firstLine[2])

var table = Array(repeating: 0, count: L + 1)

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (l, r) = (line[0], line[1])
    for i in l...r {
        table[i] += 1
    }
}

for _ in 0..<M {
    let point = Int(readLine()!)!
    print(table[point])
}