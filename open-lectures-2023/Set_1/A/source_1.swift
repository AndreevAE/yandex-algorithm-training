// A. Строительство лесенок

let N = Int(readLine()!)!

func maxRows(fromBlockCount blockCount: Int) -> Int {
    var rows = 0
    var blocksInRow = 1
    var remainBlocks = blockCount
    
    while remainBlocks >= blocksInRow {
        remainBlocks -= blocksInRow
        blocksInRow += 1
        rows += 1
    }
    
    return rows
}

print(maxRows(fromBlockCount: N))