// 16. Очередь с защитой от ошибок

struct Queue {
    
    enum Command: Equatable {
        case push(n: Int)
        case pop
        case front
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
            case "front":
                self = .front
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
    
    private var queue = [Int]()
    
    mutating func apply(_ command: Command) -> Output {
        switch command {
        case .push(n: let n):
            queue.append(n)
            return .ok
        case .pop:
            guard !queue.isEmpty else { 
                return .error
            }
            let firstElement = queue.removeFirst()
            return .value(firstElement)
        case .front:
            guard let firstElement = queue.first else {
                return .error
            }
            return .value(firstElement)
        case .size:
            return .value(queue.count)
        case .clear:
            queue = []
            return .ok
        case .exit:
            return .exit
        }
    }
}

var queue = Queue()
while let line = readLine() {
    if let command = Queue.Command(string: String(line)) {
        print(queue.apply(command))
        if command == .exit {
            break
        }
    }
}