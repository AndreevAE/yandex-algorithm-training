// 40. Метро

let N = Int(readLine()!)! // 2≤N≤100
let M = Int(readLine()!)! // 1≤M≤20
let N_1 = N + 1
let M_1 = M + 1

var lineToStations = [Set<Int>]()
lineToStations.reserveCapacity(M_1)
lineToStations.append([])
var stationToLines = [Set<Int>](repeating: [], count: N_1)
for i in 1...M {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let Pi = line[0] // 2≤Pi≤50
    let metroLine = line.dropFirst()
    lineToStations.append(Set(metroLine))
    metroLine.forEach { station in
        stationToLines[station].insert(i)
    }
}
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (A, B) = (line[0], line[1])

var stations = [Int](repeating: -1, count: N_1)
var level = 0
var linesQueue = Set<Int>()
linesQueue.reserveCapacity(M)
linesQueue = stationToLines[A]
var stationsQueue = Set<Int>()
stationsQueue.reserveCapacity(N)

while !linesQueue.isEmpty {
    stationsQueue = linesQueue
        .map { lineToStations[$0] }
        .reduce(Set<Int>()) { $0.union($1) }
        .filter { stations[$0] == -1 }
    
    stationsQueue.forEach { station in 
        stations[station] = level
    }
    
    let nextLines = stationsQueue
        .map { stationToLines[$0] }
        .reduce(Set<Int>()) { $0.union($1) }
    
    linesQueue = nextLines.subtracting(linesQueue)
    level += 1
}

print(stations[B])