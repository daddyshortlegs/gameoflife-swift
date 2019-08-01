class GameOfLife {
    func newGeneration(grid: [[String]]) -> [[String]] {
        var newGrid = [String]()
        
        var rowSize = grid[0].count
        var columnSize = grid.count
        
        var columns = [[String]]()
        
        for _ in 0..<columnSize {
            var newRow = [String]()
            for _ in 0..<rowSize {
                newRow.append(".")
            }
            
            columns.append(newRow)
        }
    
        return columns
    }
}
