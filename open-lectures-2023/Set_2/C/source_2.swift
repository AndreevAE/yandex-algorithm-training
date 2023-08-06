// C. Замена слов

let dictionaryInput = readLine()!
let textInput = readLine()!

func replace(text textInput: String, by dictionaryInput: String) -> String {
    let dictionary = Set(dictionaryInput.split(separator: " ").map { String($0) })
    let text = textInput.split(separator: " ").map { String($0) }
    
    let replacedText = text
        .map { word in
            let wordPrefixes = Array(repeating: word, count: word.count)
                .enumerated()
                .map { (offset, element) in
                    let prefixIndex = element.index(element.startIndex, offsetBy: offset)
                    return String(element[...prefixIndex])
                }
            for wordPrefix in wordPrefixes where dictionary.contains(wordPrefix) {
                return wordPrefix
            }
            
            return word
        }
    
    return replacedText.joined(separator: " ")
}

print(replace(text: textInput, by: dictionaryInput))