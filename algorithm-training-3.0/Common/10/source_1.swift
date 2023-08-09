// 10. Скучная лекция

let word = readLine()!
var currentLetterCount = word.count
var appendix = currentLetterCount
var lettersCount = [Character: Int]()
lettersCount.reserveCapacity(currentLetterCount)
for letter in word {
    lettersCount[letter, default: 0] += currentLetterCount
    appendix -= 2
    currentLetterCount += appendix
}

lettersCount.sorted { $0.key < $1.key }.forEach { letter, count in 
    print("\(letter): \(count)")
}