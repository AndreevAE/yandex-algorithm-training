// 4. Контрольная работа

enum Answer: CustomStringConvertible {
    case no
    case yes(row: Int, side: Side)
    
    var description: String {
        switch self {
        case .no: return "-1"
        case .yes(let row, let side): return "\(row) \(side)"
        }
    }
}

enum Side: Int, CustomStringConvertible {
    case right = 1
    case left = 2
    
    var description: String {
        String(rawValue)
    }
}

let N = Int(readLine()!)!
let K = Int(readLine()!)!
let row = Int(readLine()!)!
let sideRaw = Int(readLine()!)!
let side = Side(rawValue: sideRaw)!
let petyaSeat = (row - 1) * 2 + side.rawValue
let petyaVariant = (petyaSeat - 1) % K + 1
let beforeSeat = petyaSeat - K
let beforeRow = (beforeSeat + 1) / 2
let beforeSide = Side(rawValue: beforeSeat % 2 == 0 ? 2 : 1)!
let afterSeat = petyaSeat + K
let afterRow = (afterSeat + 1) / 2
let afterSide = Side(rawValue: afterSeat % 2 == 0 ? 2 : 1)!
if afterSeat <= N && beforeSeat > 0 {
    if row - beforeRow < afterRow - row {
        print(Answer.yes(row: beforeRow, side: beforeSide))
    } else {
        print(Answer.yes(row: afterRow, side: afterSide))
    }
} else if afterSeat <= N {
    print(Answer.yes(row: afterRow, side: afterSide))
} else if beforeSeat > 0 {
    print(Answer.yes(row: beforeRow, side: beforeSide))
} else {
    print(Answer.no)
}