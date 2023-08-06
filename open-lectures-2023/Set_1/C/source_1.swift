// C. Купить и продать

let N = Int(readLine()!)!

let costs = readLine()!.split(separator: " ").map { Int($0)! }

func buySellDays(for costs: [Int]) -> (buy: Int, sell: Int) {
    var (buyDay, sellDay) = (0, 0)
    var minCostDay = 0
    
    for (index, cost) in costs.enumerated().dropFirst() {
        if costs[sellDay] * costs[minCostDay] < costs[buyDay] * cost {
            buyDay = minCostDay
            sellDay = index
        }
        if cost < costs[minCostDay] {
            minCostDay = index
        }
    }
    
    if (buyDay, sellDay) != (0, 0) {
        buyDay += 1
        sellDay += 1
    }
    return (buyDay, sellDay)
}

let days = buySellDays(for: costs)
print(days.buy, days.sell)