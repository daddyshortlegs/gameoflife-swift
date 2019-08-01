import XCTest
@testable import GameOfLife

class GameOfLifeTests: XCTestCase {
    
    var gameOfLife: GameOfLife!
    
    override func setUp() {
        gameOfLife = GameOfLife()
    }

    func testShouldDie_whenLonely() {
        let grid = ["*"]
        let newGrid = gameOfLife.newGeneration(grid: grid)
        XCTAssertEqual(["."], newGrid)
    }

    func testShouldDie_whenNoNeighbours() {
        let grid = [".", "*", "."]
        let newGrid = gameOfLife.newGeneration(grid: grid)
        XCTAssertEqual([".", ".", "."], newGrid)
    }

    func testShouldDie_whenNoNeighboursOnBiggerGrid() {
        let grid = [".", "*", ".", "."]
        let newGrid = gameOfLife.newGeneration(grid: grid)
        XCTAssertEqual([".", ".", ".", "."], newGrid)
    }


}
