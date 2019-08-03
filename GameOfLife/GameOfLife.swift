class GameOfLife {
    func newGeneration(grid: [[String]]) -> [[String]] {
        var columns = [[String]]()
        for y in 0..<grid.count {
            columns.append(generateRow(grid: grid, y: y))
        }
    
        return columns
    }
    
    func generateRow(grid: [[String]], y: Int) -> [String] {
        let width = grid[0].count

        var newRow = [String]()
        for x in 0..<width {
            let neighbours = count(grid: grid, startX: x, startY: y)
            
            if grid[y][x] == "*" {
                if neighbours < 2 || neighbours > 3 {
                    newRow.append(".")
                } else {
                    newRow.append("*")
                }
            } else {
                if neighbours == 3 {
                    newRow.append("*")
                } else {
                    newRow.append(".")
                }
            }
        }
        return newRow
    }
    
    func count(grid: [[String]], startX: Int, startY: Int) -> Int {
        var total = (topBounds(startY)...bottomBounds(startY))
            .reduce(0) { $0 + countRow(row: grid[$1], startX: startX) }
        
        if grid[startY][startX] == "*" {
            total-=1
        }
        
        return total
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
