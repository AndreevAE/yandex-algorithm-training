// 32. Компоненты связности

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

func dfs(current: Int, component: Int) {
    visited[current] = true
    if component >= components.count {
        components.append([current])
    } else {
        components[component].append(current)
    }
    for neighboor in adjacencyList[current] {
        if !visited[neighboor] {
            dfs(current: neighboor, component: component)
        }
    }
}

var components = [[Int]]()
var componentIndex = 0
var visited = [Bool](repeating: false, count: N_1)
for vertex in 1...N {
    if !visited[vertex] {
        dfs(current: vertex, component: componentIndex)
        componentIndex += 1
    }
}

// FIXME: output with trailing space
print(components.count)
for component in components {
    print(component.count)
    print(component.map { "\($0) "}.joined())
}