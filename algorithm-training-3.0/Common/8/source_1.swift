// 8. Минимальный прямоугольник

let K = Int(readLine()!)!

var minX = Int.max, maxX = Int.min
var minY = Int.max, maxY = Int.min

for _ in 0..<K {
    let arr = readLine()!.split(separator: " ")
    let x = Int(arr[0])!
    let y = Int(arr[1])!
    minX = min(minX, x)
    maxX = max(maxX, x)
    minY = min(minY, y)
    maxY = max(maxY, y)
}
print(minX, minY, maxX, maxY)