// 6. Операционные системы lite

let M = Int(readLine()!)!
let N = Int(readLine()!)!
var hardDisk = Set<ClosedRange<Int>>()

for _ in 0..<N {
    let arr = readLine()!.split(separator: " ")
    let a = Int(arr[0])!
    let b = Int(arr[1])!
    let partition = a...b
    for part in hardDisk {
        if part.overlaps(partition) {
            hardDisk.remove(part)
        }
    }
    hardDisk.insert(partition)
}
print(hardDisk.count)