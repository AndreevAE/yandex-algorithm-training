// B. Наибольшая подстрока

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (firstLine[0], firstLine[1])
let s = readLine()!

func maxSubstring(in string: [Character], with k: Int) -> Int {
    guard let aAsciiValue = Character("a").asciiValue else {
        return 0
    }
    var answer = 0
    let totalUnique = Set(string).count
    
    for uniqueLim in 1...totalUnique {
        var left = 0
        var right = 0
        var counts = Array(repeating: 0, count: 26)
        if let leftAsciiValue = string[left].asciiValue {
            let charIndex = Int(leftAsciiValue - aAsciiValue)
            counts[charIndex] = 1
        }
        var kCountChars = 0
        if k == 1 {
            kCountChars = 1
        }
        var nowUnique = 1
        while right < string.count {
            if nowUnique > uniqueLim {
                guard let leftAsciiValue = string[left].asciiValue else {
                    return 0
                }
                let charIndex = Int(leftAsciiValue - aAsciiValue)
                if counts[charIndex] == k {
                    kCountChars -= 1
                }
                counts[charIndex] -= 1
                if counts[charIndex] == 0 {
                    nowUnique -= 1
                }
                left += 1
            } else {
                if kCountChars == uniqueLim {
                    answer = max(answer, right - left + 1)
                }
                right += 1
                if right < string.count {
                    guard let rightAsciiValue = string[right].asciiValue else { 
                        return 0
                    }
                    let charIndex = Int(rightAsciiValue - aAsciiValue)
                    counts[charIndex] += 1
                    if counts[charIndex] == k {
                        kCountChars += 1
                    }
                    if counts[charIndex] == 1 {
                        nowUnique += 1
                    }
                }
            }
        }
    }
    return answer
}
print(maxSubstring(in: s.map { $0 }, with: k))