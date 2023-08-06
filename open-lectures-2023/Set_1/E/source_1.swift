// E. Сломай палиндром

let palindrome = readLine()!

func breakPalindrome(_ palindrome: String) -> String {
    guard palindrome.count > 1 else { return "" }
    
    let middleIndex = palindrome.index(palindrome.startIndex, offsetBy: palindrome.count / 2)
    
    if let firstNotAIndex = palindrome[..<middleIndex].firstIndex(where: { $0 != "a" }) {
        let secondHalfStartIndex = palindrome.index(firstNotAIndex, offsetBy: 1)
        return palindrome[..<firstNotAIndex] + "a" + palindrome[secondHalfStartIndex...]
    }
    
    let indexBeforeEnd = palindrome.index(before: palindrome.endIndex)
    
    return palindrome[..<indexBeforeEnd] + "b"
}

print(breakPalindrome(palindrome))