// 17. Игра в пьяницу

enum Winner: String, CustomStringConvertible {
    case first
    case second
    case botva
    
    var description: String {
        rawValue
    }
}

var firstDeck = readLine()!.split(separator: " ").map { Int($0)! }
var secondDeck = readLine()!.split(separator: " ").map { Int($0)! }

let maxMoves = 100_000
var movesCount = 0

while !firstDeck.isEmpty && !secondDeck.isEmpty && movesCount < maxMoves {
    let first = firstDeck.removeFirst()
    let second = secondDeck.removeFirst()
    if first == 0 && second == 9 {
        firstDeck.append(first)
        firstDeck.append(second)
    } else if first == 9 && second == 0 {
        secondDeck.append(first)
        secondDeck.append(second)
    } else if first > second {
        firstDeck.append(first)
        firstDeck.append(second)
    } else { // second > first
        secondDeck.append(first)
        secondDeck.append(second)
    }
    movesCount += 1
}
if firstDeck.isEmpty {
    print(Winner.second, movesCount)
}
if secondDeck.isEmpty {
    print(Winner.first, movesCount)
}
if movesCount >= maxMoves {
    print(Winner.botva)
}