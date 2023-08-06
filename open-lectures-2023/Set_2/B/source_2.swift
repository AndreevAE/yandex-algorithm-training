// B. Разноцветные палочки

enum Color: Int, CaseIterable {
    case red = 0b001
    case green = 0b010
    case blue = 0b100
    
    init?(char: Character) {
        switch char {
        case "R":
            self = .red
        case "G":
            self = .green
        case "B":
            self = .blue
        default:
            return nil
        }
    }
    
    static let allColorsSum = Color.allCases.reduce(0) { $0 | $1.rawValue }
}

let encodedString = readLine()!

let colors = encodedString.enumerated().filter { $0.offset % 2 == 0 }.compactMap { Color(char: $0.element) }
let positions = encodedString.enumerated().filter { $0.offset % 2 == 1 }.map { Int(String($0.element))! }
let colorsAndPositions = zip(colors, positions)

var sticks = Array(repeating: 0b0, count: 10)

colorsAndPositions.forEach { color, position in 
    sticks[position] |= color.rawValue
}

print(sticks.filter { $0 == Color.allColorsSum }.count)