// 31. Поиск в глубину

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

var visited = [Bool](repeating: false, count: N_1)

func dfs(current: Int) {
    visited[current] = true
    for neighboor in adjacencyList[current] {
        if !visited[neighboor] {
            dfs(current: neighboor)
        }
    }
}
dfs(current: 1)

print(visited.filter { $0 }.count)
print(visited.enumerated().filter { $0.element }.map { String($0.offset) }.joined(separator: " "))