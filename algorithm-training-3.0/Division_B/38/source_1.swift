// 38. Блохи

typealias KnightMoveDelta = (i: Int, iPredicate: (Int, Range<Int>) -> Bool, j: Int, jPredicate: (Int, Range<Int>) -> Bool)
let knightMoveDeltas: [KnightMoveDelta] = [
    (-2, { i, range in range ~= (i - 2) }, -1, { j, range in range ~= (j - 1) }),
    (-2, { i, range in range ~= (i - 2) }, 1, { j, range in range ~= (j + 1) }),
    (-1, { i, range in range ~= (i - 1) }, -2, { j, range in range ~= (j - 2) }),
    (-1, { i, range in range ~= (i - 1) }, 2, { j, range in range ~= (j + 2) }),
    (1, { i, range in range ~= (i + 1) }, -2, { j, range in range ~= (j - 2) }),
    (1, { i, range in range ~= (i + 1) }, 2, { j, range in range ~= (j + 2) }),
    (2, { i, range in range ~= (i + 2) }, -1, { j, range in range ~= (j - 1) }),
    (2, { i, range in range ~= (i + 2) }, 1, { j, range in range ~= (j + 1) }),
]
typealias Point = (x: Int, y: Int)

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let N = firstLine[0] // 2 ≤ N, M ≤ 250
let M = firstLine[1]
let S = firstLine[2]
let T = firstLine[3]
let Q = firstLine[4] // 0 ≤ Q ≤ 10000

let start: Point = (S - 1, T - 1)
var board = [Int](repeating: -1, count: N * M)
var queue = [Point]()
queue.reserveCapacity(N * M)
var index = 0
queue.append(start)
board[start.x * M + start.y] = 0

while index < queue.count {
    let cell = queue[index]
    for move in knightMoveDeltas {
        if move.iPredicate(cell.x, 0..<N) && move.jPredicate(cell.y, 0..<M) {
            let movePoint: Point = (x: cell.x + move.i, y: cell.y + move.j)
            if board[movePoint.x * M + movePoint.y] == -1 {
                board[movePoint.x * M + movePoint.y] = board[cell.x * M + cell.y] + 1
                queue.append(movePoint)
            }
        }
    }
    index += 1
}

var sum = 0
for _ in 0..<Q {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let point: Point = (line[0] - 1, line[1] - 1)
    let pathLen = board[point.x * M + point.y]
    if pathLen == -1 {
        sum = -1
        break
    } else {
        sum += pathLen
    }
}
print(sum)