// 11. Стек с защитой от ошибок

struct Stack {

    enum Command: Equatable {
        case push(n: Int)
        case pop
        case back
        case size
        case clear
        case exit
        
        init?(string: String) {
            switch string {
            case let pushN where string.hasPrefix("push"):
                let args = pushN.split(separator: " ")
                guard 
                    args.count == 2, 
                    let n = Int(args[1])
                else {
                    return nil
                }
                self = .push(n: n)
            case "pop":
                self = .pop
            case "back":
                self = .back
            case "size":
                self = .size
            case "clear":
                self = .clear
            case "exit":
                self = .exit
            default: return nil
            }
        }
    }
    
    enum Output: CustomStringConvertible {
        case ok
        case error
        case exit
        case value(Int)
        
        var description: String {
            switch self {
            case .ok: return "ok"
            case .error: return "error"
            case .exit: return "bye"
            case .value(let val): return "\(val)"
            }
        }
    }
    
    private var stack = [Int]()
    
    mutating func apply(_ command: Command) -> Output {
        switch command {
        case .push(n: let n):
            stack.append(n)
            return .ok
        case .pop:
            guard let lastElement = stack.popLast() else { 
                return .error
            }
            return .value(lastElement)
        case .back:
            guard let lastElement = stack.last else {
                return .error
            }
            return .value(lastElement)
        case .size:
            return .value(stack.count)
        case .clear:
            stack = []
            return .ok
        case .exit:
            return .exit
        }
    }
}

var stack = Stack()
while let line = readLine() {
    if let command = Stack.Command(string: String(line)) {
        print(stack.apply(command))
        if command == .exit {
       	    break
        }
    }
}