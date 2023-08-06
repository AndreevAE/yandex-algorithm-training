// E. Путь к файлу

let filename = readLine()!
let N = Int(readLine()!)!

var pathStack = [String]()
let pathSeparator = "/"
for _ in 0..<N {
    let line = readLine()!
    let charIndex = line.firstIndex(where: { !$0.isWhitespace }) ?? line.endIndex
    let level = line[..<charIndex].count
    let name = String(line[charIndex...])
    
    pathStack.removeLast(pathStack.count - level)
    pathStack.append(name)
    if name == filename {
        break
    }
}

print(pathSeparator + pathStack.joined(separator: pathSeparator))