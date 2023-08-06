// D. Размер поддеревьев

let V = Int(readLine()!)!
let V_1 = V + 1

var adjacencyList = [[Int]](repeating: [], count: V_1)
for _ in 0..<V - 1 {
    let rib = readLine()!.split(separator: " ").map { Int($0)! }
    let (left, right) = (rib[0], rib[1])
    adjacencyList[left].append(right)
    if left != right {
        adjacencyList[right].append(left)
    }
}

var subtreeCount = [Int](repeating: 0, count: V_1)

func dfs(current: Int) -> Int {
    subtreeCount[current] = 1
    subtreeCount[current] = adjacencyList[current]
        .filter { subtreeCount[$0] == 0 }
        .reduce(1) { $0 + dfs(current: $1) }
    return subtreeCount[current]
}
_ = dfs(current: 1)
print(
    subtreeCount
        .dropFirst()
        .map { String($0) }
        .joined(separator: " ")
)