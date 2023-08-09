// 28. Космический мусорщик

enum Command: Character, CustomStringConvertible {
    case north = "N"
    case south = "S"
    case west = "W"
    case east = "E"
    case up = "U"
    case down = "D"
    
    var index: Int {
        switch self {
        case .north: return 0
        case .south: return 1
        case .west: return 2
        case .east: return 3
        case .up: return 4
        case .down: return 5
        }
    }
    
    var description: String {
        String(rawValue)
    }
}

let N = readLine()!.compactMap { Command(rawValue: $0) }
let S = readLine()!.compactMap { Command(rawValue: $0) }
let W = readLine()!.compactMap { Command(rawValue: $0) }
let E = readLine()!.compactMap { Command(rawValue: $0) }
let U = readLine()!.compactMap { Command(rawValue: $0) }
let D = readLine()!.compactMap { Command(rawValue: $0) }
let line = readLine()!.split(separator: " ").map { String($0) }
let command = Command(rawValue: Character(line[0]))!
let parameter = Int(line[1])!

let rules = [N, S, W, E, U, D]

func executeDynamically(command: Command, parameter: Int, rules: [[Command]]) -> Int {
    let N = parameter
    let M = 6
    var moves = [Int](repeating: 0, count: N * M)
    
    for j in 0..<M {
        moves[j] = 1
    }
    for i in 1..<N {
        for j in 0..<M {
            moves[i * M + j] = rules[j].map { moves[(i - 1) * M + $0.index]}.reduce(1, +)
        }
    }
    
    return moves[(N - 1) * M + command.index]
}

print(executeDynamically(command: command, parameter: parameter, rules: rules))