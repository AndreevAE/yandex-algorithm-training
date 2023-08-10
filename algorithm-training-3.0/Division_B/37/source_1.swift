// 37. Путь в графе

let N = Int(readLine()!)! // 1 ≤ N ≤ 100
let N_1 = N + 1

var adjacencyList = [[Int]](repeating: [], count: N_1)

for i in 1...N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }.enumerated().filter { $0.element == 1 }.map { $0.offset + 1 }
    adjacencyList[i] = line
}

let line = readLine()!.split(separator: " ").map { Int($0)! }
let start = line[0]
let end = line[1]

var pathLength = [Int](repeating: -1, count: N_1)
var previousVertexes = [Int](repeating: -1, count: N_1)
var queue = [Int]()
queue.reserveCapacity(N_1)
var index = 0
queue.append(start)
pathLength[start] = 0
while index < queue.count {
    let vertex = queue[index]
    for neighboor in adjacencyList[vertex] where pathLength[neighboor] == -1 {
        pathLength[neighboor] = pathLength[vertex] + 1
        previousVertexes[neighboor] = vertex
        queue.append(neighboor)
    }
    index += 1
}

let length = pathLength[end]
if length == -1 || length == 0 {
    print(length)
} else {
    print(length)
    var path = [Int]()
    path.reserveCapacity(length)
    path.append(end)
    var current = previousVertexes[end]
    while current != start {
        path.append(current)
        current = previousVertexes[current]
    }
    path.append(current)
    print(path.reversed().map { String($0) }.joined(separator: " "))
}