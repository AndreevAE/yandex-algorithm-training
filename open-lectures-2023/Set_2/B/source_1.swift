// B. Разноцветные палочки

enum Color: Character {
    case red = "R"
    case green = "G"
    case blue = "B"
}

let encodedString = readLine()!

func allColorSticksCount(fromEncoded string: String) -> Int {
    let colors = encodedString.enumerated().filter { $0.offset % 2 == 0 }.compactMap { Color(rawValue: $0.element) }
    let positions = encodedString.enumerated().filter { $0.offset % 2 == 1 }.map { Int(String($0.element))! }
    let colorsAndPositions = zip(colors, positions)
    
    var sticks = Array(repeating: Set<Color>(), count: 10)
    
    colorsAndPositions.forEach { color, position in 
        sticks[position].insert(color)
    }
    
    return sticks.filter { $0.count == 3 }.count
}

print(allColorSticksCount(fromEncoded: encodedString))