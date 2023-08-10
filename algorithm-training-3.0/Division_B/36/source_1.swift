// 36. Длина кратчайшего пути

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
var queue = [Int]()
queue.reserveCapacity(N_1)
var index = 0
queue.append(start)
pathLength[start] = 0
while index < queue.count {
    let vertex = queue[index]
    for neighboor in adjacencyList[vertex] where pathLength[neighboor] == -1 {
        pathLength[neighboor] = pathLength[vertex] + 1
        queue.append(neighboor)
    }
    index += 1
}

print(pathLength[end])