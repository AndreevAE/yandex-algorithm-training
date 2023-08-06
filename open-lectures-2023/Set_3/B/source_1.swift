// B. Бумеры и зумеры

let _ = Int(readLine()!)!
let ages = readLine()!.split(separator: " ").map { Int($0)! }

func sumInvites(ages: [Int]) -> Int {
    guard ages.count > 1 else { 
        return 0
    }
    
    var sum = 0
    var left = 0
    var right = 0
    for x in ages {
        let x = Double(x)
        while left < ages.count && Double(ages[left]) <= 0.5 * x + 7 {
            left += 1
        }
        while right < ages.count && Double(ages[right]) <= x {
            right += 1
        }
        if right > left + 1 {
            sum += right - (left + 1)
        }
    }
    
    return sum
}

print(sumInvites(ages: ages.sorted()))