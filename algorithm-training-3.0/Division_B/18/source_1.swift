// 18. Дек с защитой от ошибок

struct Deque {
     
     enum Command: Equatable {
         case push_front(n: Int)
         case push_back(n: Int)
         case pop_front
         case pop_back
         case front
         case back
         case size
         case clear
         case exit
         
         init?(string: String) {
             switch string {
             case let pushN where string.hasPrefix("push_front"):
                 let args = pushN.split(separator: " ")
                 guard 
                     args.count == 2, 
                     let n = Int(args[1])
                 else {
                     return nil
                 }
                 self = .push_front(n: n)
             case let pushN where string.hasPrefix("push_back"):
                 let args = pushN.split(separator: " ")
                 guard 
                     args.count == 2, 
                     let n = Int(args[1])
                 else {
                     return nil
                 }
                 self = .push_back(n: n)
             case "pop_front":
                 self = .pop_front
             case "pop_back":
                 self = .pop_back
             case "front":
                 self = .front
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
     
     private var deque = {
         var arr = [Int]()
         arr.reserveCapacity(100)
         return arr
     }()
     
     mutating func apply(_ command: Command) -> Output {
         switch command {
         case .push_front(n: let n):
             deque.insert(n, at: 0)
             return .ok
         case .push_back(n: let n):
             deque.append(n)
             return .ok
         case .pop_front:
             guard !deque.isEmpty else { 
                 return .error
             }
             let firstElement = deque.removeFirst()
             return .value(firstElement)
         case .pop_back:
             guard let lastElement = deque.popLast() else {
                 return .error
             }
             return .value(lastElement)
         case .front:
             guard let firstElement = deque.first else {
                 return .error
             }
             return .value(firstElement)
         case .back:
             guard let lastElement = deque.last else {
                 return .error
             }
             return .value(lastElement)
         case .size:
             return .value(deque.count)
         case .clear:
             deque = []
             return .ok
         case .exit:
             return .exit
         }
     }
 }
 
 var deque = Deque()
 while let line = readLine() {
     if let command = Deque.Command(string: String(line)) {
         print(deque.apply(command))
         if command == .exit {
             break
         }
     }
 }