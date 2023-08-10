// 39. Путь спелеолога

typealias MoveDelta = (
    i: Int, iPredicate: (Int, Range<Int>) -> Bool,
    j: Int, jPredicate: (Int, Range<Int>) -> Bool,
    k: Int, kPredicate: (Int, Range<Int>) -> Bool
)
let moveDeltas: [MoveDelta] = [
    (
        -1, { i, range in range ~= (i - 1) },
        +0, { j, range in range ~= (j + 0) },
        +0, { k, range in range ~= (k + 0) }
    ),
    (
        +1, { i, range in range ~= (i + 1) },
        +0, { j, range in range ~= (j + 0) },
        +0, { k, range in range ~= (k + 0) }
    ),
    (
        +0, { i, range in range ~= (i + 0) },
        -1, { j, range in range ~= (j - 1) },
        +0, { k, range in range ~= (k + 0) }
    ),
    (
        +0, { i, range in range ~= (i + 0) },
        +1, { j, range in range ~= (j + 1) },
        +0, { k, range in range ~= (k + 0) }
    ),
    (
        +0, { i, range in range ~= (i + 0) },
        +0, { j, range in range ~= (j + 0) },
        -1, { k, range in range ~= (k - 1) }
    ),
    (
        +0, { i, range in range ~= (i + 0) },
        +0, { j, range in range ~= (j + 0) },
        +1, { k, range in range ~= (k + 1) }
    ),
]
typealias Point = (x: Int, y: Int, z: Int)

enum Cave: Character, CustomStringConvertible {
    case stone = "#"
    case empty = "."
    case speleologist = "S"
    
    var description: String {
        String(rawValue)
    }
}

let N = Int(readLine()!)! // 1 ≤ N ≤ 30

var cave = [Cave]()
cave.reserveCapacity(N * N * N)
var start: Point = (-1, -1, -1)
for i in 0..<N {
	_ = readLine()
    for j in 0..<N {
        let row = readLine()!.map { Cave(rawValue: $0)! }
        cave.append(contentsOf: row)
        if let k = row.firstIndex(of: .speleologist) {
            start = (i, j, k)
        }
    }
}

var cavePath = [Int](repeating: -1, count: N * N * N)
cavePath[start.x * N * N + start.y * N + start.z] = 0

var queue = [Point]()
queue.reserveCapacity(N * N * N)
queue.append(start)
var queueIndex = 0

while queueIndex < queue.count {
    let cell = queue[queueIndex]
    for move in moveDeltas {
        if move.iPredicate(cell.x, 0..<N) 
            && move.jPredicate(cell.y, 0..<N) 
            && move.kPredicate(cell.z, 0..<N) {
            let movePoint: Point = (x: cell.x + move.i, y: cell.y + move.j, z: cell.z + move.k)
            let moveIndex = movePoint.x * N * N + movePoint.y * N + movePoint.z
            if cavePath[moveIndex] == -1 && cave[moveIndex] == .empty {
                cavePath[moveIndex] = cavePath[cell.x * N * N + cell.y * N + cell.z] + 1
                queue.append(movePoint)
            }
        }
    }
    queueIndex += 1
}

print(cavePath[0..<N * N].filter { $0 != -1 }.min()!)