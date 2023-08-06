// C. Замена слов

let dictionaryWords = readLine()!.split(separator: " ").map { String($0) }.sorted()
let dictionary = Dictionary(grouping: dictionaryWords, by: { $0.first! })
let text = readLine()!.split(separator: " ").map { String($0) }

let replacedText = text.map { word in
    guard 
        let firstChar = word.first,
        let dictWords = dictionary[firstChar]
    else { return word }
    
    for dictWord in dictWords where word.hasPrefix(dictWord) {
        return dictWord
    }
    
    return word
}

print(replacedText.joined(separator: " "))