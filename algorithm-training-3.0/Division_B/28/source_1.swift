// 28. Ход конём

let line = readLine()!.split(separator: " ")
let N = Int(line[0])!
let M = Int(line[1])!

var chessboard = [Int](repeating: 0, count: N * M)
chessboard[0] = 1
if N > 1 && M > 2 {
    chessboard[1 * M + 2] = 1
}
if N > 2 && M > 1 {
    chessboard[2 * M + 1] = 1
}
if N > 2 && M > 2 {
    for i in 2..<N {
        for j in 2..<M {
            chessboard[i * M + j] = chessboard[(i - 1) * M + (j - 2)] + chessboard[(i - 2) * M + (j - 1)]
        }
    }
}

print(chessboard.last!)