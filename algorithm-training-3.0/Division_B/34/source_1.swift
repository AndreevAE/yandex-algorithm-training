// 34. Топологическая сортировка

enum Color: Int, CustomStringConvertible {
    case white
    case grey
    case black
    
    var description: String {
        String(rawValue)
    }
}

// FIXME: output with trailing space
let line = readLine()!.split(separator: " ").map { Int($0)! }
let N = line[0] // 1 ≤ N, M ≤ 100 000
let M = line[1]
let N_1 = N + 1
var adjacencyList = [[Int]](repeating: [], count: N_1)
for _ in 0..<M {
    let rib = readLine()!.split(separator: " ").map { Int($0)! }
    let (left, right) = (rib[0], rib[1])
    adjacencyList[left].append(right)
}

var visited = [Color](repeating: .white, count: N_1)
var answer = [Int]()
answer.reserveCapacity(N)
var isPossible = true
func dfs(current: Int) {
    visited[current] = .grey
    for neighboor in adjacencyList[current] {
        switch visited[neighboor] {
        case .white:
            dfs(current: neighboor)
        case .grey:
            isPossible = false
        case .black:
            break
        }
    }
    visited[current] = .black
    answer.append(current)
}
for vertex in 1...N {
    if visited[vertex] != .black {
        dfs(current: vertex)
    }
}
if isPossible {
    print(answer.reversed().map { "\($0) " }.joined())
} else {
    print("-1")
}