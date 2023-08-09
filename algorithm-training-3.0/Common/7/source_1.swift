// 7. SNTP

import Foundation

struct Timestamp: CustomStringConvertible {
    private let timeInSeconds: Int
    private static var a24hours: Int {
        24 * 60 * 60
    }
    
    init(timeInSeconds: Int) {
        self.timeInSeconds = timeInSeconds
    }
    
    init(string: String) {
        let components = string.split(separator: ":")
        let hh = Int(components[0])!
        let mm = Int(components[1])!
        let ss = Int(components[2])!
        
        self.timeInSeconds = ((hh * 60) + mm) * 60 + ss
    }
    
    var description: String {
        let ss = timeInSeconds % 60
        let mm = (timeInSeconds / 60) % 60
        let hh = timeInSeconds / (60 * 60)
        
        return [hh, mm, ss].map { String(format: "%02d", $0) }.joined(separator: ":")
    }
    
    static func + (left: Timestamp, right: Timestamp) -> Timestamp {
        let sum = (left.timeInSeconds + right.timeInSeconds) % a24hours
        return Timestamp(timeInSeconds: sum)
    }
    
    static func - (left: Timestamp, right: Timestamp) -> Timestamp {
        var leftOperand: Int = left.timeInSeconds
        if left.timeInSeconds < right.timeInSeconds {
            leftOperand += a24hours
        }
        let diff = leftOperand - right.timeInSeconds
        return Timestamp(timeInSeconds: diff)
    }
    
    static func / (left: Timestamp, right: Int) -> Timestamp {
        let div = Double(left.timeInSeconds) / Double(right)
        return Timestamp(timeInSeconds: Int(round(div)))
    }
}

let A = Timestamp(string: String(readLine()!))
let B = Timestamp(string: String(readLine()!))
let C = Timestamp(string: String(readLine()!))

let clientTimestamp = (C - A) / 2 + B
print(clientTimestamp)