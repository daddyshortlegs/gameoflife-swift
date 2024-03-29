import XCTest
@testable import GameOfLife

class GameOfLifeTests: XCTestCase {
    
    var gameOfLife: GameOfLife!
    
    func nextGeneration(of grid: [[String]]) -> [[String]] {
        gameOfLife = GameOfLife(grid: grid)
        return gameOfLife.newGeneration()
    }

    func count(of grid: [[String]], _ coordinate: Coordinate) -> Int {
        gameOfLife = GameOfLife(grid: grid)
        return gameOfLife.count(coordinate)
    }
    
    func xtestShouldDie_whenLonely() {
        let grid = [["*"]]
        let result = nextGeneration(of: grid)
        XCTAssertEqual([["."]], result)
    }

    func xtestShouldDie_whenNoNeighbours() {
        let grid = [[".", "*", "."]]
        let result = nextGeneration(of: grid)
        XCTAssertEqual([[".", ".", "."]], result)
    }

    func xtestShouldDie_whenNoNeighboursOnBiggerGrid() {
        let grid = [[".", "*", ".", "."]]
        let result = nextGeneration(of: grid)
        XCTAssertEqual([[".", ".", ".", "."]], result)
    }

    func testShouldDie_whenNoNeighboursOn2DWorld() {
        let grid = [[".", ".", "."],
                    [".", "*", "."],
                    [".", ".", "."]]
        
        let result = nextGeneration(of: grid)

        let newGrid = [[".", ".", "."],
                       [".", ".", "."],
                       [".", ".", "."]]
        XCTAssertEqual(newGrid, result)
    }
    
    func testShouldDie_whenFewerThan2Neighbours() {
        let grid = [[".", "*", "."],
                    [".", "*", "."],
                    [".", ".", "."]]
        
        let result = nextGeneration(of: grid)

        let newGrid = [[".", ".", "."],
                       [".", ".", "."],
                       [".", ".", "."]]
        XCTAssertEqual(newGrid, result)
    }

    func testShouldDie_whenMoreThan3Neighbours() {
        let grid = [[".", "*", "*"],
                    [".", "*", "*"],
                    [".", "*", "."]]
        
        let result = nextGeneration(of: grid)

        let newGrid = [[".", "*", "*"],
                       ["*", ".", "."],
                       [".", "*", "*"]]
        XCTAssertEqual(newGrid, result)
    }

    
    func testDeadCellShouldReanmiate_when3Neighbours() {
        let grid = [[".", "*", "."],
                    [".", "*", "*"],
                    [".", ".", "."]]
        
        let result = nextGeneration(of: grid)

        let newGrid = [[".", "*", "*"],
                       [".", "*", "*"],
                       [".", ".", "."]]
        XCTAssertEqual(newGrid, result)
    }
    
    func testCellsShouldSurvive_when3Neibhbours() {
        let grid = [[".", "*", "*"],
                    [".", "*", "*"],
                    [".", ".", "."]]
        
        let result = nextGeneration(of: grid)

        let newGrid = [[".", "*", "*"],
                       [".", "*", "*"],
                       [".", ".", "."]]
        XCTAssertEqual(newGrid, result)
    }

    
    func testLiveCellSurvives_when2Or3Neighbours() {
        let grid = [[".", "*", "."],
                    [".", "*", "."],
                    [".", "*", "."]]
        
        let result = nextGeneration(of: grid)

        let newGrid = [[".", ".", "."],
                       ["*", "*", "*"],
                       [".", ".", "."]]
        XCTAssertEqual(newGrid, result)
    }

    func testLiveCellSurvives_when2Or3NeighboursOnaABiggerBoard() {
        let grid = [[".", ".", ".", "."],
                    [".", "*", ".", "."],
                    [".", "*", ".", "."],
                    [".", "*", ".", "."]]
        
        let result = nextGeneration(of: grid)

        let newGrid = [[".", ".", ".", "."],
                       [".", ".", ".", "."],
                       ["*", "*", "*", "."],
                       [".", ".", ".", "."]]
        XCTAssertEqual(newGrid, result)
    }

    
    
    
    
    func testGetCorrectCountAtPosition() {
        let grid = [[".", "*", "."],
                    [".", "*", "*"],
                    [".", ".", "."]]
        
        let result = count(of: grid, Coordinate(x: 1, y: 1))
        
        XCTAssertEqual(2, result)
    }
    
    func testGetCorrectCount_withFullGrid() {
        let grid = [["*", "*", "*"],
                    ["*", "*", "*"],
                    ["*", "*", "*"]]
        
        let result = count(of: grid, Coordinate(x: 1, y: 1))

        XCTAssertEqual(8, result)
    }

    func testGetCorrectCount_fromTopRow() {
        let grid = [["*", "*", "*"],
                    ["*", "*", "*"],
                    ["*", "*", "*"]]
        
        let result = count(of: grid, Coordinate(x: 1, y: 0))

        XCTAssertEqual(5, result)
    }

    func testGetCorrectCount_fromBottomRow() {
        let grid = [["*", "*", "*"],
                    ["*", "*", "*"],
                    ["*", "*", "*"]]
        
        let result = count(of: grid, Coordinate(x: 1, y: 2))

        XCTAssertEqual(5, result)
    }

    func testGetCorrectCount_fromLeft() {
        let grid = [["*", "*", "*"],
                    ["*", "*", "*"],
                    ["*", "*", "*"]]
        
        let result = count(of: grid, Coordinate(x: 0, y: 0))

        XCTAssertEqual(3, result)
    }

    func testGetCorrectCount_fromRight() {
        let grid = [["*", "*", "*"],
                    ["*", "*", "*"],
                    ["*", "*", "*"]]
        
        let result = count(of: grid, Coordinate(x: 2, y: 2))

        XCTAssertEqual(3, result)
    }

    func testGetCorrectCount_forBiggerBoard() {
        let grid = [["*", "*", "*", "*"],
                    ["*", "*", "*", "*"],
                    ["*", "*", "*", "*"],
                    ["*", "*", "*", "*"]]
        
        let result = count(of: grid, Coordinate(x: 1, y: 1))
        
        XCTAssertEqual(8, result)
    }

    func testGetCorrectCount1() {
        let grid = [[".", "*", "."],
                    [".", "*", "."],
                    [".", "*", "."]]

        let result = count(of: grid, Coordinate(x: 0, y: 0))
        
        XCTAssertEqual(2, result)
    }
}
