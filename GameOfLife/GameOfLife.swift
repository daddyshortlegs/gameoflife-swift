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
        var count = 0
        
        var top = (startY - 1) < 0 ? 0 : startY - 1
        var bottom = (startY + 1) > 2 ? 2 : startY + 1
        
        for y in top...bottom {
            count += countRow(row: grid[y], startX: startX)
        }

        return count - 1
    }
    
    func countRow(row: [String], startX: Int) -> Int {
        return (leftBounds(startX)...rightBounds(startX))
            .filter { row[$0] == "*" }
            .count
    }
    
    func leftBounds(_ startX: Int) -> Int {
        return (startX - 1) < 0 ? 0 : startX - 1
    }
    
    func rightBounds(_ startX: Int) -> Int {
        return (startX + 1) > 2 ? 2 : startX + 1
    }

}
