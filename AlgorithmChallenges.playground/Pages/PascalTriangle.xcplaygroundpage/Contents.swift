
import Foundation


let test = 2

printPascalTriangle(test)

func printPascalTriangle(_ rows: Int) {
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
}
