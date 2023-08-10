// 33. Списывание

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
    
    var another: Color {
        switch self {
        case .grey: return .black
        case .black: return .grey
        case .white: return .white
        }
    }
}

let line = readLine()!.split(separator: " ").map { Int($0)! }
let N = line[0] // 1 ≤ N ≤ 10^3
let M = line[1] // 0 ≤ M ≤ 5 * 10^5
let N_1 = N + 1
var adjacencyList = [[Int]](repeating: [], count: N_1)
for _ in 0..<M {
    let rib = readLine()!.split(separator: " ").map { Int($0)! }
    let (left, right) = (rib[0], rib[1])
    adjacencyList[left].append(right)
    if left != right {
        adjacencyList[right].append(left)
    }
}

var answer = Answer.yes
func dfs(current: Int, color: Color) {
    visited[current] = color
    for neighboor in adjacencyList[current] {
        switch visited[neighboor] {
        case .white:
            dfs(current: neighboor, color: color.another)
        case .grey, .black:
            if color == visited[neighboor] {
                answer = .no
            }
        }
    }
}

var visited = [Color](repeating: .white, count: N_1)
for vertex in 1...N {
    if visited[vertex] == .white {
        dfs(current: vertex, color: .grey)
    }
}

print(answer)