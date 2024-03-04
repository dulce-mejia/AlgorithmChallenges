
import Foundation
import XCTest


let test = 2

printPascalTriangle(test)

func printPascalTriangle(_ rows: Int) -> [[Int]] {
  var triangle: [[Int]] = [[1]]
  print("\(triangle[0])")
  for row in 1..<rows {
    var numbers: [Int] = []
    if row > 1 {
      for n in 0..<triangle[row-1].count - 1 {
        let rowNumbers = triangle[row-1]
        numbers.append(rowNumbers[n] + rowNumbers[n+1])
      }
    }
    numbers.insert(1, at: .zero)
    numbers.append(1)
    triangle.append(numbers)
    print("\(triangle[row])")
  }
  return triangle
}


PascalTriangleTests.defaultTestSuite.run()

  

// UnitTests Class

class PascalTriangleTests: XCTestCase {
  
    var sut: [[Int]]? = nil
  
    override func setUp() {
        super.setUp()
    }
  
    func testOnlyOneRow() {
      // Given
      let rows = 1
      // When
      let result = printPascalTriangle(rows)
      // Then
      XCTAssertEqual(result[0].count, 1)
    }
  
    func testRowsStartsAndEndsInOne() {
      // Given
      let randomInt = Int.random(in: 1..<10)
      // When
      let result = printPascalTriangle(10)
      // Then
      XCTAssertEqual(result[randomInt].first, 1)
      XCTAssertEqual(result[randomInt].last, 1)
    }
    
    func testNumberOfRowsAccordingInput() {
        // Given
        let rows = 5
        // When
        let result = printPascalTriangle(rows)
        // Then
      XCTAssertEqual(result.count, rows)
    }
  
  override func tearDown() {
    super.tearDown()
    sut = nil
  }
}
