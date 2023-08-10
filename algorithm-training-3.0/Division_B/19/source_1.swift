// 19. Хипуй

enum Command {
    case insert(Int)
    case extract
    
    init?(string: String) {
        switch string {
        case let insertN where string.hasPrefix("0"):
            let args = insertN.split(separator: " ")
            guard 
                args.count == 2, 
                let n = Int(args[1])
            else {
                return nil
            }
            self = .insert(n)
        case "1":
            self = .extract
        default: return nil
        }
    }
}

struct Heap {
    private var array = [Int]()
    
    // (i - 1) // 2 -> i
    // i -> 2i + 1 | 2i + 2
    
    mutating func insert(_ value: Int) {
        array.append(value)
        var index = array.count - 1
        while index > 0 && array[index] > array[(index - 1) / 2] {
            (array[index], array[(index - 1) / 2]) = (array[(index - 1) / 2], array[index])
            index = (index - 1) / 2
        }
    }
    
    mutating func extract() -> Int {
        let maximum = array[0]
        array[0] = array[array.count - 1]
        var index = 0
        while index * 2 + 1 < array.count - 1 {
            var minSonIndex = index * 2 + 1
            if array[index * 2 + 2] > array[minSonIndex] {
                minSonIndex = index * 2 + 2
            }
            if array[index] < array[minSonIndex] {
                (array[index], array[minSonIndex]) = (array[minSonIndex], array[index])
                index = minSonIndex
            } else {
                break
            }
        }
        array.popLast()
        return maximum
    }
}

let N = Int(readLine()!)!
var heap = Heap()

for _ in 0..<N {
    let command = Command(string: String(readLine()!))!
    switch command {
    case .insert(let number):
        heap.insert(number)
    case .extract:
        print(heap.extract())
    }
}