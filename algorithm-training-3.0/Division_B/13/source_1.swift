// 13. Постфиксная запись

enum Lexeme: CustomStringConvertible {
    
    enum Operation: Character, CustomStringConvertible {
        case add = "+"
        case sub = "-"
        case mul = "*"
        
        var description: String {
            String(rawValue)
        }
        
        func apply(left: Int, right: Int) -> Int {
            switch self {
            case .add:
                return left + right
            case .sub:
                return left - right
            case .mul:
                return left * right
            }
        }
    }
    
    case operand(Int)
    case operation(Operation)
    
    init(char: Character) {
        if let operation = Operation(rawValue: char) {
            self = .operation(operation)
        } else {
            self = .operand(Int(String(char))!)
        }
    }
    
    var description: String {
        switch self {
        case .operand(let value):
            return String(value)
        case .operation(let operation):
            return operation.description
        }
    }
}

let lexemes = readLine()!.split(separator: " ").map { Lexeme(char: Character(String($0))) }
var stack = [Int]()
for lexeme in lexemes {
    switch lexeme {
    case .operand(let number):
        stack.append(number)
    case .operation(let operation):
        let right = stack.popLast()!
        let left = stack.popLast()!
        let result = operation.apply(left: left, right: right)
        stack.append(result)
    }
}
print(stack.first!)