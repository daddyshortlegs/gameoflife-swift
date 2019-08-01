import XCTest
@testable import GameOfLife

class GameOfLifeTests: XCTestCase {
    
    var gameOfLife: GameOfLife!
    
    override func setUp() {
        gameOfLife = GameOfLife()
    }

    func testShouldDie_whenLonely() {
        let grid = [["*"]]
        let newGrid = gameOfLife.newGeneration(grid: grid)
        XCTAssertEqual([["."]], newGrid)
    }

    func testShouldDie_whenNoNeighbours() {
        let grid = [[".", "*", "."]]
        let newGrid = gameOfLife.newGeneration(grid: grid)
        XCTAssertEqual([[".", ".", "."]], newGrid)
    }

    func testShouldDie_whenNoNeighboursOnBiggerGrid() {
        let grid = [[".", "*", ".", "."]]
        let newGrid = gameOfLife.newGeneration(grid: grid)
        XCTAssertEqual([[".", ".", ".", "."]], newGrid)
    }

    func testShouldDie_whenNoNeighboursOn2DWorld() {
        let grid = [[".", ".", "."],
                    [".", "*", "."],
                    [".", ".", "."]]
        
        let result = gameOfLife.newGeneration(grid: grid)
        
        let newGrid = [[".", ".", "."],
                       [".", ".", "."],
                       [".", ".", "."]]
        XCTAssertEqual(newGrid, result)
    }

    func xtestShouldLive_when2Neighbours() {
        let grid = [[".", "*", "."],
                    [".", "*", "*"],
                    [".", ".", "."]]
        
        let result = gameOfLife.newGeneration(grid: grid)
        
        let newGrid = [[".", "*", "."],
                       [".", "*", "*"],
                       [".", ".", "."]]
        XCTAssertEqual(newGrid, result)
    }
    
    func testGetCorrectCountAtPosition() {
        let grid = [[".", "*", "."],
                    [".", "*", "*"],
                    [".", ".", "."]]
        
        let result = gameOfLife.count(grid: grid, startX: 1, startY: 1)
        
        XCTAssertEqual(2, result)
    }
    
    func testGetCorrectCount_withFullGrid() {
        let grid = [["*", "*", "*"],
                    ["*", "*", "*"],
                    ["*", "*", "*"]]
        
        let result = gameOfLife.count(grid: grid, startX: 1, startY: 1)
        
        XCTAssertEqual(8, result)
    }

    func testGetCorrectCount_fromTopRow() {
        let grid = [["*", "*", "*"],
                    ["*", "*", "*"],
                    ["*", "*", "*"]]
        
        let result = gameOfLife.count(grid: grid, startX: 1, startY: 0)
        
        XCTAssertEqual(5, result)
        
    }


    
}
