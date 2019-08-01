class GameOfLife {
    func newGeneration(grid: [String]) -> [String] {
        if grid.count == 1 {
            return ["."]
        }
        
        var newGrid = [String]()
        
        for _ in 0..<grid.count {
            newGrid.append(".")
        }
        return newGrid
    }
}
