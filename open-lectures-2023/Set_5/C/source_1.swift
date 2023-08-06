// C. Горы

let N = Int(readLine()!)!
let heights = readLine()!.split(separator: " ").map { Int($0)! }

for i in 1..<heights.count {
    if heights[i - 1] < heights[i] && heights[i] > heights[i + 1] {
        print(i + 1)
        break
    }
}