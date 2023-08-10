// 12. Правильная скобочная последовательность

infix operator <> : ComparisonPrecedence

enum Parenthesis: Character {
    case opening = "("
    case closing = ")"
    
    case openingSquare = "["
    case closingSquare = "]"
    
    case openingCurly = "{"
    case closingCurly = "}"
    
    var isOpening: Bool {
        switch self {
        case .opening, .openingSquare, .openingCurly:
            return true
        case .closing, .closingSquare, .closingCurly:
            return false
        }
    }
    
    var isClosing: Bool {
        !isOpening
    }
    
    static func <> (left: Parenthesis, right: Parenthesis) -> Bool {
        switch left {
        case .opening:
            return right == .closing
        case .openingSquare:
            return right == .closingSquare
        case .openingCurly:
            return right == .closingCurly
        default:
            return false
        }
    }
}

enum Answer: String, CustomStringConvertible {
    case yes
    case no
    
    var description: String {
        rawValue
    }
}

let sequence = readLine()!

var stack = [Parenthesis]()
var answer = Answer.yes
for char in sequence {
    if let parenthesis = Parenthesis(rawValue: char) {
        if parenthesis.isOpening {
            stack.append(parenthesis)
        } else if let last = stack.popLast(), last <> parenthesis {
        } else {
            answer = .no
        }
    }
}
if !stack.isEmpty {
    answer = .no
}
print(answer)