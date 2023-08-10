// 30. НОП с восстановлением ответа

import Foundation

let N = Int(readLine()!.trimmingCharacters(in: .whitespaces))!
let sequence1 = readLine()!.split(separator: " ").map { Int(String($0))! }
let M = Int(readLine()!.trimmingCharacters(in: .whitespaces))! // FIXME: bug in test samples: trailing whitespace
let sequence2 = readLine()!.split(separator: " ").map { Int(String($0))! }

let N_1 = N + 1
let M_1 = M + 1

var subsequences = [Int](repeating: 0, count: N_1 * M_1)
for i in 1...N {
    for j in 1...M {
        if sequence1[i - 1] == sequence2[j - 1] {
            let diagonalLeftTop = subsequences[(i - 1) * M_1 + (j - 1)]
            subsequences[i * M_1 + j] = diagonalLeftTop + 1
        } else {
            let top = subsequences[(i - 1) * M_1 + j]
            let left = subsequences[i * M_1 + (j - 1)]
            subsequences[i * M_1 + j] = max(top, left)
        }
    }
}

var i = N
var j = M
var reversedSubsequence = [Int]()
reversedSubsequence.reserveCapacity(min(N, M))
while i > 0 && j > 0 {
    let center = subsequences[i * M_1 + j]
    let diagonal = subsequences[(i - 1) * M_1 + (j - 1)]
    let top = subsequences[(i - 1) * M_1 + j]
    let left = subsequences[i * M_1 + (j - 1)]
    if sequence1[i - 1] == sequence2[j - 1] && center == diagonal + 1 {
        reversedSubsequence.append(sequence1[i - 1])
        i -= 1
        j -= 1
    } else if top >= left {
        i -= 1
    } else {
        j -= 1
    }
}

print(reversedSubsequence.reversed().map { "\($0) " }.joined())
// FIXME: bug in answers: trailing whitespace too ??