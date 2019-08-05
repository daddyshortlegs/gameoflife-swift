class World {
    let grid: [[String]]
    
    init(grid: [[String]]) {
        self.grid = grid
    }
    
    func tick() -> [[String]] {
        return grid.enumerated().map { (index, element) in generateRow(y: index) }
    }
    
    func generateRow(y: Int) -> [String] {
        return grid[0].enumerated().map { (x, element) in
            getCell(pos: grid[y][x], neighbours: count(Coordinate(x: x, y: y)))
        }
    }
    
    func count(_ coordinate: Coordinate) -> Int {
        let total = (lowerBounds(coordinate.y)...upperBounds(coordinate.y))
            .reduce(0) { $0 + countRow(row: grid[$1], coordinate) }
        
        if grid[coordinate.y][coordinate.x] == "*" {
            return total - 1
        }
        
        return total
    }
    
    func countRow(row: [String], _ coordinate: Coordinate) -> Int {
        return (lowerBounds(coordinate.x)...upperBounds(coordinate.x))
            .filter { row[$0] == "*" }
            .count
    }
    
    func lowerBounds(_ pos: Int) -> Int {
        return (pos - 1) < 0 ? 0 : pos - 1
    }
    
    func upperBounds(_ pos: Int) -> Int {
        return (pos + 1) > 2 ? 2 : pos + 1
    }
    
    func getCell(pos: String, neighbours: Int) -> String {
        if (pos == "*" && neighbours == 2) {
            return "*"
        }
        
        return neighbours == 3 ? "*" : "."
    }

}
