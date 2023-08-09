// 1. Гистограмма

extension Collection where Self.Iterator.Element: RandomAccessCollection {
    func transposed() -> [[Self.Iterator.Element.Iterator.Element]] {
        guard let firstRow = self.first else { return [] }
        return firstRow.indices.map { index in
            self.map{ $0[index] }
        }
    }
}

var resultLine = ""
while let line = readLine() {
    resultLine += line
}
let charCount = Dictionary(
    grouping: resultLine
        .map { $0 }
        .filter { !$0.isWhitespace },
    by: { $0 }
)
.mapValues { $0.count }
let maxHeight = charCount.values.max()!
let sortedCharCount = charCount
    .sorted { $0.key.asciiValue! < $1.key.asciiValue! }
let sortedChars = sortedCharCount.map { String($0.key) }.joined()
let histogram = sortedCharCount
    .map { Array(repeating: " ", count: maxHeight - $0.value) + Array(repeating: "#", count: $0.value) }
    .transposed()
    .map { $0.joined() }
    .joined(separator: "\n")
print(histogram, sortedChars, separator: "\n")