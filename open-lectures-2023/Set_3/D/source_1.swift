// D. Коровы в стойла

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (firstLine[0], firstLine[1])
let stalls = readLine()!.split(separator: " ").map { Int($0)! }

func maxDistance(in stalls: [Int], for cows: Int) -> Int {
    func good(m: Int, k: Int, stalls: [Int]) -> Bool {
        var cowsCount = 1
        var prevPosition = stalls[0]
        for stall in stalls {
            if stall - prevPosition >= m {
                cowsCount += 1
                prevPosition = stall
            }
        }
        return cowsCount >= k
    }
    
    guard var r = stalls.last else { return 0 }
    var l = 0
    while r > l {
        var m = (l + r + 1) / 2
        if good(m: m, k: cows, stalls: stalls) {
            l = m
        } else {
            r = m - 1
        }
    }
    return l
}

print(maxDistance(in: stalls, for: K))