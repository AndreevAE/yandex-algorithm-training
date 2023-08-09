// 11. Конвейер

enum Answer: Int, CustomStringConvertible {
    case yes = 1
    case no = 0
    
    var description: String {
        String(rawValue)
    }
}

func canSort(containers: [Double]) -> Answer {
    var answer = Answer.yes
    var store = [Double]()
    store.reserveCapacity(containers.count)
    var bTopContainer = 0.0
    containers.forEach { container in
        if let lastInStore = store.last, container > lastInStore {
            while let lastInStore = store.last, lastInStore < container {
                if lastInStore >= bTopContainer {
                    bTopContainer = lastInStore
                    store.removeLast()
                } else {
                    answer = .no
                    return
                }
            }
        }
        store.append(container)
    }
    while let lastInStore = store.popLast(), lastInStore >= bTopContainer {
        bTopContainer = lastInStore
    }
    if !store.isEmpty {
        answer = .no
    }
    return answer
}

let N = Int(readLine()!)!

for _ in 0..<N {
    let line = readLine()!.split(separator: " ")
    let K = Int(line[0])!
    let A = line.dropFirst().map { Double($0)! }
    print(canSort(containers: A))
}