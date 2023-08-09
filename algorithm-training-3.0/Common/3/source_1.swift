// 3. Коллекционер Диего

extension RandomAccessCollection where Element: Comparable {
  func binarySearch(for value: Element, in range: Range<Index>? = nil)
      -> Index? {
    let range = range ?? startIndex..<endIndex
    guard range.lowerBound < range.upperBound else {
        return range.lowerBound
    }
    let size = distance(from: range.lowerBound, to: range.upperBound)
    let middle = index(range.lowerBound, offsetBy: size / 2)
    if self[middle] == value {
      return middle
    } else if self[middle] > value {
      return binarySearch(for: value, in: range.lowerBound..<middle)
    } else {
      return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
    }
  }
}

let N = Int(readLine()!)!
let stickers = Set(readLine()!.split(separator: " ").map { Int($0)! }).sorted()
let K = Int(readLine()!)!
let minStickers = readLine()!.split(separator: " ").map { Int ($0)! }

for minimum in minStickers {
    let index = stickers.binarySearch(for: minimum)!
    print(index)
    
    continue
    let diff = stickers.filter { $0 < minimum }.count
    print(diff)
}