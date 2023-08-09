// 2. Красивая строка

let k = Int(readLine()!)!
let S = readLine()!.map { Character(String($0)) }

func calcMaxBeauty(for str: [Character]) -> Int {
    var maxBeauty = 1
    
    var chars = Set(str)
    for char in chars {
        var right = str.firstIndex(of: char)!
        var left = max(0, right - k)
        var currentK = k - (right - left)
        
        while right < str.count {
            if str[right] != char {
                currentK -= 1
            }
            while currentK < 0 {
                if str[left] != char {
                    currentK += 1
                }
                left += 1
            }
            maxBeauty = max(maxBeauty, right - left + 1)
            right += 1
        }
    }
    return maxBeauty
}
print(calcMaxBeauty(for: S))