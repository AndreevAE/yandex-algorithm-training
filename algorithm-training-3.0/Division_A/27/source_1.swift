// 27. Расстояние по Левенштейну

let string1 = readLine()!.map { $0 }
let string2 = readLine()!.map { $0 }
let N = string1.count
let M = string2.count
let N_1 = N + 1
let M_1 = M + 1

var distances = [Int](repeating: 0, count: N_1 * M_1)

for j in 1..<M_1 {
    distances[j] = j
}
for i in 1..<N_1 {
    distances[i * M_1] = i
}

for i in 1..<N_1 {
    for j in 1..<M_1 {
        if string1[i - 1] == string2[j - 1] {
            distances[i * M_1 + j] = distances[(i - 1) * M_1 + (j - 1)]
        } else {
            let diagonal = distances[(i - 1) * M_1 + (j - 1)] + 1
            let top = distances[(i - 1) * M_1 + j] + 1
            let left = distances[i * M_1 + (j - 1)] + 1
            distances[i * M_1 + j] = min(diagonal, left, top)
        }
    }
}

print(distances.last!)