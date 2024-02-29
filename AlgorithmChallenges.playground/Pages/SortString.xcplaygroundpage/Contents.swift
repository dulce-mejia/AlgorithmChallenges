import XCTest

//Daily Algorithm Challenge

/***Title: Alphanumeric String Sort
Description:
Taking a string as input sort the string characters with the following rules:
Numbers go after Letters
Uppercase letters go after Lowercase
Odd numbers go before Even numbers
Any character that is not a letter or number should go after the letters and numbers*/

let result = "4D.a7@eCb".sortString()
print(result)

SortStringTests.defaultTestSuite.run()








// UnitTests Class

class SortStringTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func testSortString_allElements() {
        // Given
        let stringExample = "4D.a7@eCb"
        // When
        let result = stringExample.sortString()
        // Then
        XCTAssertEqual(result, "aebDC74.@")
    }
    
    func testSortString_OnlyNumbers() {
        // Given
        let stringExample = "80734821"
        // When
        let result = stringExample.sortString()
        // Then
        XCTAssertEqual(result, "73180482")
    }
    
    func testSortString_OnlyLowercasedSymbols() {
        // Given
        let stringExample = ".di@r_"
        // When
        let result = stringExample.sortString()
        // Then
        XCTAssertEqual(result, "dir.@_")
    }
    
    func testSortString_OnlyLowercasedSymbols2() {
        // Given
        let stringExample = ".diár_ñ"
        // When
        let result = stringExample.sortString()
        // Then
        XCTAssertEqual(result, "diárñ._")
    }
}

