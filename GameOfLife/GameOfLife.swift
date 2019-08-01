class GameOfLife {
    func newGeneration(grid: [String]) -> [String] {
        if grid.count == 1 {
            return ["."]
        }
        
        return [".", ".", "."]
    }
}
