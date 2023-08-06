// B. Гости

let N = Int(readLine()!)!

typealias Guest = (index: Int, checkIn: Int, checkOut: Int)
var guests = [Guest]()
guests.reserveCapacity(N)
for i in 0..<N {
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (arr[0], arr[1])
    guests.append((index: i, checkIn: a, checkOut: b))
}

let sortedByCheckInGuests = guests.sorted(by: {
    if $0.checkIn == $1.checkIn {
        return $0.checkOut > $1.checkOut
    }
    return $0.checkIn < $1.checkIn
})

var prevGuest = Guest(0, 0, 0)
let optimizedGuests = sortedByCheckInGuests.map {
    if $0.checkOut > prevGuest.checkOut {
        let checkIn = max(prevGuest.checkOut + 1, $0.checkIn)
        let checkOut = $0.checkOut
        prevGuest = Guest($0.index, checkIn, checkOut)
        return prevGuest
    } else {
        return Guest($0.index, -1, -1)
    }
}
.sorted(by: { $0.index < $1.index })

optimizedGuests.forEach {
    print($0.checkIn, $0.checkOut)
}