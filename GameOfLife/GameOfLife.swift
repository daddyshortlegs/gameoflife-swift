class GameOfLife {
    let world: World
    
    init(grid: [[String]]) {
        self.world = World(grid: grid)
    }
    
    func newGeneration() -> [[String]] {
        return world.tick()
    }
    
    func count(_ coordinate: Coordinate) -> Int {
        return world.count(coordinate)
    }
}
