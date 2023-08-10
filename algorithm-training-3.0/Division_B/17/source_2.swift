// 17. Игра в пьяницу

enum Winner: String, CustomStringConvertible {
    case first
    case second
    case botva
    
    var description: String {
        rawValue
    }
}

class Card: CustomStringConvertible, Comparable {
    let value: Int
    var nextCard: Card?
    
    var description: String {
        String(value)
    }
    
    init(_ value: Int) {
        self.value = value
    }
    
    static func < (lhs: Card, rhs: Card) -> Bool {
        if lhs.value == 0 && rhs.value == 9 {
            return false
        }
        if lhs.value == 9 && rhs.value == 0 {
            return true
        }
        return lhs.value < rhs.value
    }
    
    static func > (lhs: Card, rhs: Card) -> Bool {
        if lhs.value == 0 && rhs.value == 9 {
            return true
        }
        if lhs.value == 9 && rhs.value == 0 {
            return false
        }
        return lhs.value > rhs.value
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.value == rhs.value
    }
}

struct Deck: CustomDebugStringConvertible {
    var headCard: Card?
    private var tailCard: Card?
    
    var isEmpty: Bool {
        headCard == nil
    }
    
    var debugDescription: String {
        [headCard, tailCard].compactMap { $0?.description }.joined(separator: " H -> T ")
    }
    
    init(head: Card) {
        self.headCard = head
        self.tailCard = head
        
        while let next = tailCard?.nextCard {
            tailCard = next
        }
    }
    
    mutating func push(card: Card) {
        if headCard == nil {
            self.headCard = card
            self.tailCard = card
        } else {
            tailCard?.nextCard = card
            tailCard = card
        }
    }
    
    mutating func pop() -> Card? {
        let card = headCard
        if headCard === tailCard {
            headCard = nil
            tailCard = nil
        } else {
            headCard = headCard?.nextCard
        }
        
        return card
    }
}

let firstDeckCards = readLine()!.split(separator: " ").map { Card(Int($0)!) }
let secondDeckCards = readLine()!.split(separator: " ").map { Card(Int($0)!) }

zip(firstDeckCards.dropLast(), firstDeckCards.dropFirst()).forEach { left, right in 
    left.nextCard = right
}
zip(secondDeckCards.dropLast(), secondDeckCards.dropFirst()).forEach { left, right in
    left.nextCard = right
}

var firstDeck = Deck(head: firstDeckCards.first!)
var secondDeck = Deck(head: secondDeckCards.first!)

let maxMoves = 100_000
var movesCount = 0

while !firstDeck.isEmpty && !secondDeck.isEmpty && movesCount < maxMoves {
    let first = firstDeck.pop()!
    let second = secondDeck.pop()!
    if first < second {
        secondDeck.push(card: first)
        secondDeck.push(card: second)
    } else if first > second {
        firstDeck.push(card: first)
        firstDeck.push(card: second)
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