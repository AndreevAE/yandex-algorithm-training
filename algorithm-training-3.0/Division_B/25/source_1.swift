// 25. Гвоздики

let N = Int(readLine()!)!
let coordinates = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var a = [Int](repeating: 0, count: N + 1)
a[1] = 100000
for i in 2...N {
    a[i] = min(a[i - 1], a[i - 2]) + coordinates[i - 1] - coordinates[i - 2]
}
print(a.last!)