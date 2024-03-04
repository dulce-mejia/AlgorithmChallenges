
import XCTest
// Find Winner on a Tic Tac Toe Game

let input1: [(Int, Int)] = [(0,2),(2,0),(1,1),(2,1),(2,0)]

let input2: [(Int, Int)] = [(0,0),(1,1),(0,1),(0,2),(1,0),(2,0)]

let input3 = [(0,0),(1,1),(2,0),(1,0),(1,2),(2,1),(0,1),(0,2),(2,2)]

print("Result...", playTicTacToe(input1))

print("Result...", playTicTacToe(input2))

print("Result...", playTicTacToe(input3))

func playTicTacToe(_ input: [(Int, Int)]) -> String {
  let validCoordenates = input.allSatisfy { ($0.0 >= 0 && $0.0 <= 2) && ($0.1 >= 0 && $0.1 <= 2) }
  guard validCoordenates else { return "Wrong entry" }
  guard input.count >= 5 else { return "Needs moves" }
  guard input.count <= 9 else { return "Invalid moves" }
  
  // check winner
  var winner: String = "Draw"
  
  let playerA = input
    .enumerated()
    .filter{ $0.0 % 2 == 0 }
    .map { $0.1 }
  let playerB = input
    .enumerated()
    .filter{ $0.0 % 2 != 0 }
    .map { $0.1 }
  
  //print("playerA moves..", playerA)
  //print("playerB moves..", playerB)
  for index in 0..<playerA.count {
    if playerB.contains(playerA[index]) {
      winner = "Moves reapeated. Invalid game"
      break
    }
  }
  
  if isWinner(playerA) { // Determine if playerA wins
    return "PlayerA wins"
  } else if isWinner(playerB) { // Determine if playerB wins
    return "PlayerB wins"
  }
    
  return winner
}

private func isWinner(_ moves: [(Int, Int)]) -> Bool {
  guard moves.count >= 3 else { return false }
  var byRow = false
  var byColumn = false
  var diagonal = false
  let groupedRow = Dictionary(grouping: moves, by: { $0.0 })
  let groupedCol = Dictionary(grouping: moves, by: { $0.1 })
  
  // Determines by row
  byRow = groupedRow[0]?.count == 3 || groupedRow[1]?.count == 3 || groupedRow[2]?.count == 3
  // Determines by column
  byColumn = groupedCol[0]?.count == 3 || groupedCol[1]?.count == 3 || groupedCol[2]?.count == 3
  
  guard !(byRow && byColumn) else { return ( byRow || byColumn ) }
  // Determines by diagonal
  let dialReverseCombinations: [(Int, Int)] = [(2,0), (0,2), (1, 1)]
  
  diagonal = moves.allSatisfy { $0.0 == $0.1 } || moves.map { dialReverseCombinations.contains($0) }.allSatisfy{$0}
  
  return byRow || byColumn || diagonal
}



TicTacToeTests.defaultTestSuite.run()

// UnitTests Class

class TicTacToeTests: XCTestCase {
  
    override func setUp() {
        super.setUp()
    }
    
    func testInputsWrongCoordinate() {
        // Given
        let input: [(Int, Int)] = [(0,1),(2,0),(1,1),(2,3),(2,2)]
        // When
        let result = playTicTacToe(input)
        // Then
        XCTAssertEqual(result, "Wrong entry")
    }
  
  func testFewNumberOfMoves() {
      // Given
      let input: [(Int, Int)] = [(0,1),(2,0)]
      // When
      let result = playTicTacToe(input)
      // Then
      XCTAssertEqual(result, "Needs moves")
  }
  
  func testInvalidNumberOfMoves() {
      // Given
      let input: [(Int, Int)] = [(0,0),(1,1),(2,0),(1,0),(1,2),(2,1),(0,1),(0,2),(2,2),(1,0)]
      // When
      let result = playTicTacToe(input)
      // Then
      XCTAssertEqual(result, "Invalid moves")
  }
  
  func testRepeatedOfMoves() {
      // Given
      let input: [(Int, Int)] = [(0,1),(0,1),(1,1),(2,1),(2,2)]
      // When
      let result = playTicTacToe(input)
      // Then
      XCTAssertEqual(result, "Moves reapeated. Invalid game")
  }
  
  func testResultAsDraw() {
      // Given
      let input = [(0,0),(1,1),(2,0),(1,0),(1,2),(2,1),(0,1),(0,2),(2,2)]
      // When
      let result = playTicTacToe(input)
      // Then
      XCTAssertEqual(result, "Draw")
  }
  
  func testPlayerAWins() {
      // Given
      let input: [(Int, Int)] = [(0,0),(2,0),(1,1),(2,1),(2,2)]
      // When
      let result = playTicTacToe(input)
      // Then
      XCTAssertEqual(result, "PlayerA wins")
  }
  
  func testPlayerBWins() {
      // Given
      let input: [(Int, Int)] = [(0,0),(1,1),(0,1),(0,2),(1,0),(2,0)]
      // When
      let result = playTicTacToe(input)
      // Then
      XCTAssertEqual(result, "PlayerB wins")
  }
}
