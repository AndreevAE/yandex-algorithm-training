// E. Варим зелья

let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (firstLine[0], firstLine[1])
let ingredients = readLine()!.split(separator: " ").map { Int($0)! }

func maxSumUsefulness(of potions: Int, from ingredients: [Int]) -> Int {
    let inf = 1_000_000_000_000_000_000
    func check(minUs: Int) -> Int {
        var answer = 0
        var count = 0
        for i in 1...ingredients.count {
            if usefulness[i] < minUs {
                break
            }
            count += 1
            answer += usefulness[i]
        }
        
        var j = 2
        while j <= ingredients.count && usefulness[1] + usefulness[j] >= minUs {
            j += 1
        }
        
        for i in 1...ingredients.count {
            if i + 1 >= j {
                break
            }
            while j - 1 > i && usefulness[i] + usefulness[j - 1] < minUs {
                j -= 1
            }
            count += (j - i - 1)
            answer += prefSum[j - 1] - prefSum[i] + usefulness[i] * (j - i - 1)
        }
        if count >= potions {
            return answer - (count - potions) * minUs
        } else {
            return inf
        }
    }
    
    let usefulness = [0] + ingredients.sorted(by: >)
    var prefSum = Array(repeating: 0, count: ingredients.count + 1)
    for i in 1...ingredients.count {
        prefSum[i] = prefSum[i - 1] + usefulness[i]
    }
    let maxElem = 1_000_000_000
    var l = -maxElem
    var r = maxElem
    while r > l {
        var m = (l + r + 1) / 2
        if check(minUs: m) != inf {
            l = m
        } else {
            r = m - 1
        }
    }
    return check(minUs: l)
}

print(maxSumUsefulness(of: k, from: ingredients))