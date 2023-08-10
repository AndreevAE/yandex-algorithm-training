// 35. Поиск цикла

enum Answer: String, CustomStringConvertible {
    case yes
    case no
    
    var description: String {
        rawValue.uppercased()
    }
}

enum Color: Int {
    case white
    case grey
    case black
}

let N = Int(readLine()!)! // 1 ≤ n ≤ 500
let N_1 = N + 1

var matrix = [[Int]]()
matrix.append([Int](repeating: 0, count: N_1))
for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    matrix.append([0] + row)
}
var visited = [Color](repeating: .white, count: N_1)
var answer = [Int]()
var cycleCompleted = false
func dfs(current: Int, parent: Int) {
    visited[current] = .grey
    let neighboors = matrix[current].enumerated().filter { $0.element == 1 }.map { $0.offset }
    for neighboor in neighboors where neighboor != parent && answer.isEmpty {
        switch visited[neighboor] {
        case .white:
            dfs(current: neighboor, parent: current)
            if !answer.isEmpty {
                if neighboor == answer.first {
                    cycleCompleted = true
                }
                if !cycleCompleted {
                    answer.append(neighboor)
                }
            }
        case .grey:
            answer.append(neighboor)
        case .black:
            break
        }
    }
    visited[current] = .black
}
for vertex in 1...N {
    if visited[vertex] != .black {
        dfs(current: vertex, parent: 0)
    }
}
if !answer.isEmpty {
    print(Answer.yes)
    print(answer.count)
    print(answer.map { "\($0) " }.joined())
} else {
    print(Answer.no)
}