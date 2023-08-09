// 9. Сумма в прямоугольнике

let params = readLine()!.split(separator: " ").map { Int($0)! }
let N = params[0]
let M = params[1]
let K = params[2]

var matrix = [Int]()
matrix.reserveCapacity(N * M)
for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    matrix.append(contentsOf: row)
}

for i in 0..<N {
    var sum = 0
    for j in 0..<M {
        let element = matrix[i * M + j]
        matrix[i * M + j] += sum
        sum += element
    }
}

for j in 0..<M {
    var sum = 0
    for i in 0..<N {
        let element = matrix[i * M + j]
        matrix[i * M + j] += sum
        sum += element
    }
}

for _ in 0..<K {
    let coordinates = readLine()!.split(separator: " ").map { Int($0)! }
    let x1 = coordinates[0] - 1
    let y1 = coordinates[1] - 1
    let x2 = coordinates[2] - 1
    let y2 = coordinates[3] - 1
    
    var sum = matrix[x2 * M + y2]
    if x1 > 0 {
        sum -= matrix[(x1 - 1) * M + y2]
    }
    if y1 > 0 {
        sum -= matrix[x2 * M + (y1 - 1)]
    }
    if x1 > 0 && y1 > 0 {
        sum += matrix[(x1 - 1) * M + (y1 - 1)]
    }
    print(sum)
}