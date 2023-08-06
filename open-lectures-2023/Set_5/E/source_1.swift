// E. PitCraft

let N = Int(readLine()!)!
let heights = readLine()!.split(separator: " ").map { Int($0)! }

func waterfilledCount(for heights: [Int]) -> Int {
    let maxIndex = heights.enumerated().max { $0.element < $1.element }?.offset ?? 0
    
    var result = 0
    var currentMax = heights.first ?? 0
    for height in heights[..<maxIndex] {
        if height > currentMax {
            currentMax = height
        } else {
            result += currentMax - height
        }
    }
    
    currentMax = heights.last ?? 0
    for height in heights[maxIndex...].reversed() {
        if height > currentMax {
            currentMax = height
        } else {
            result += currentMax - height
        }
    }
    
    return result
}

print(waterfilledCount(for: heights))