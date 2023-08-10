// 15. Великое Лайнландское переселение

typealias Town = (index: Int, price: Int)

let N = Int(readLine()!)!
let prices = readLine()!.split(separator: " ").map { Int($0)! }

var migrations = [Int](repeating: -1, count: N)
var stack = [Town]()
stack.reserveCapacity(N)

for (index, price) in prices.enumerated() {
    while let lastTown = stack.last, lastTown.price > price {
        migrations[lastTown.index] = index
        stack.popLast()
    }
    stack.append(Town(index, price))
}

print(migrations.map { String($0) }.joined(separator: " "))