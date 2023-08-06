// A. Группы и аудитории

let n = Int(readLine()!)!
let groups = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
let rooms = readLine()!.split(separator: " ").map { Int($0)! }

func filledRooms(from rooms: [Int], by groups: [Int]) -> Int {
    let sortedRooms = rooms.sorted()
    let sortedGroups = groups.sorted()
    
    var roomIndex = 0
    var groupIndex = 0
    
    while roomIndex < sortedRooms.count && groupIndex < sortedGroups.count {
        if sortedRooms[roomIndex] >= sortedGroups[groupIndex] {
            groupIndex += 1
        }
        roomIndex += 1
    }
    
    return groupIndex
}

print(filledRooms(from: rooms, by: groups))