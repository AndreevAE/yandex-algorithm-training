// D. Удали строку

let s = readLine()!

func minLengthAfterOperations(with string: [Character]) -> Int {
    var left = 0
    var right = string.count - 1
    
    while left < right && string[left] == string[right] {
        var currentChar = string[left]
        while left < right && string[left] == currentChar {
            left += 1
        }
        while left <= right && string[right] == currentChar {
            right -= 1
        }
    }
    
    return right - left + 1
}

print(minLengthAfterOperations(with: s.map { $0 }))