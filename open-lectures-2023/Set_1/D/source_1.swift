// D. Разница во времени

let _ = Int(readLine()!)!

func minutes(from string: String) -> Int {
    let numbers = string.split(separator: ":").map { Int($0)! }
    let (hours, minutes) = (numbers[0], numbers[1])
    let totalMinutes = hours * 60 + minutes
    return totalMinutes
}

let timetable = readLine()!.split(separator: " ").map { minutes(from: String($0)) }.sorted()

func minimumMinutes(_ timetable: [Int]) -> Int {
    guard 
        let first = timetable.first,
        let last = timetable.last 
    else { return 0 }
    
    let minutesInDay = 24 * 60
    var minimum = minutesInDay + first - last
    
    zip(timetable.dropLast(), timetable.dropFirst())
        .forEach { prev, next in 
            minimum = min(minimum, next - prev)
        }
    
    return minimum
}

print(minimumMinutes(timetable))