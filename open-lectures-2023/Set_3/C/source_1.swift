// C. Гирлянды

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (firstLine[0], firstLine[1])

var colors = [Int]()
colors.reserveCapacity(k)
for _ in 0..<k {
    let color = Int(readLine()!)!
    colors.append(color)
}

func good(m: Int) -> Bool {
    var inGarland = 0
    for color in colors {
        inGarland += color / m
    }
    return inGarland >= n
}

var l = 0
var r = 2 * 1_000_000_000
while l < r {
    let m = (l + r + 1) / 2
    if good(m: m) {
        l = m
    } else {
        r = m - 1
    }
}
print(l)
var usedLamps = 0
for i in 0..<k {
    for j in 0..<min(colors[i] / l, n - usedLamps) {
        print(i + 1)
        usedLamps += 1
    }
}