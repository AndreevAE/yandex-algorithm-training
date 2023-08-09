// 26. Ход конём - 2

import Foundation

typealias KnightMoveDelta = (i: Int, iPredicate: (Int, Range<Int>) -> Bool, j: Int, jPredicate: (Int, Range<Int>) -> Bool)
let knightMoveDeltas: [KnightMoveDelta] = [
    (-1, { i, range in range ~= (i - 1) }, -2, { j, range in range ~= (j - 2) }),
    (-2, { i, range in range ~= (i - 2) }, -1, { j, range in range ~= (j - 1) }),
    (1, { i, range in range ~= (i + 1) }, -2, { j, range in range ~= (j - 2) }),
    (-2, { i, range in range ~= (i - 2) }, 1, { j, range in range ~= (j + 1) })
] 
let line = readLine()!.split(separator: " ")
let N = Int(line[0])! // 1 <= N, M <= 50
let M = Int(line[1])!

var chessboard = [Decimal](repeating: 0, count: N * M)
chessboard[0] = 1

for diagonal in 0...(N + M - 2) {
    for i in 0...min(diagonal, N - 1) {
        let j = diagonal - i
        if j < M {
            for delta in knightMoveDeltas {
                if delta.iPredicate(i, 0..<N) && delta.jPredicate(j, 0..<M) {
                    chessboard[i * M + j] += chessboard[(i + delta.i) * M + (j + delta.j)]
                }
            }
        }
    }
}

print(chessboard.last!)