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
    
    func count(grid: [[String]], x: Int, y: Int) -> Int {
        return 2
    }

}
