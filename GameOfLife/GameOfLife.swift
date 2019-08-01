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
        var width = grid[0].count
        var height = grid.count

        var count = 0
        var top = (startY - 1)
        var bottom = (startY + 1)
        var left = (startX - 1)
        var right = (startX + 1)
        
        for y in top...bottom {
            for x in left...right {
                var element = grid[y][x]
                if element == "*" {
                    count+=1
                }
            }
        }

        return count - 1
    }

}
