class GameOfLife {
    func newGeneration(grid: [[String]]) -> [[String]] {
        var width = grid[0].count
        var height = grid.count

        
        
        
        var newGrid = [String]()
        
        
        
        
        
        var columns = [[String]]()
        
        for _ in 0..<height {
            var newRow = [String]()
            for _ in 0..<width {
                newRow.append(".")
            }
            
            columns.append(newRow)
        }
    
        return columns
    }
    
    func count(grid: [[String]], startX: Int, startY: Int) -> Int {
        return ((topBounds(startY)...bottomBounds(startY))
            .reduce(0) { $0 + countRow(row: grid[$1], startX: startX) }) - 1
    }
    
    func countRow(row: [String], startX: Int) -> Int {
        return (leftBounds(startX)...rightBounds(startX))
            .filter { row[$0] == "*" }
            .count
    }
    
    func topBounds(_ startY: Int) -> Int {
        return (startY - 1) < 0 ? 0 : startY - 1
    }

    func bottomBounds(_ startY: Int) -> Int {
        return (startY + 1) > 2 ? 2 : startY + 1
    }

    func leftBounds(_ startX: Int) -> Int {
        return (startX - 1) < 0 ? 0 : startX - 1
    }
    
    func rightBounds(_ startX: Int) -> Int {
        return (startX + 1) > 2 ? 2 : startX + 1
    }

}
