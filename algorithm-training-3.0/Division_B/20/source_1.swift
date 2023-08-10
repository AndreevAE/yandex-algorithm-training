// 20. Пирамидальная сортировка

extension Array where Element: Comparable {
    mutating func heapSort() {
        heapify()
        shrinkHeap()
    }
    
    private mutating func heapify() {
        for index in 1..<count {
            var child = index
            while child > 0 && self[child] > self[(child - 1) / 2] {
                (self[child], self[(child - 1) / 2]) = (self[(child - 1) / 2], self[child])
                child = (child - 1) / 2
            }
        }
    }
    
    private mutating func shrinkHeap() {
        for index in stride(from: count - 1, to: 0, by: -1) {
            (self[0], self[index]) = (self[index], self[0])
            var parent = 0
            while parent < index {
                var maxChild = -1
                if (parent * 2) + 1 < index {
                    maxChild = (parent * 2) + 1
                } else {
                    break
                }
                if (parent * 2) + 2 < index && self[(parent * 2) + 2] > self[maxChild] {
                    maxChild = (parent * 2) + 2
                }
                guard self[maxChild] > self[parent] else { break }
                
                (self[parent], self[maxChild]) = (self[maxChild], self[parent])
                parent = maxChild
            }
        }
    }
}

_ = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int($0)! }

numbers.heapSort()
print(numbers.map { String($0) }.joined(separator: " "))