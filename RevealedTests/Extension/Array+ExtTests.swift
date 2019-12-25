//
//  Array+ExtTests.swift
//  RevealedTests
//
//  Created by KokHong on 25/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Foundation
import XCTest
class ArrayExtTests: XCTestCase {
  func testSafeIndexExtension() {
    let emptyArray: [Int] = []

    XCTAssertNil(emptyArray[safeIndex: 0])

    let array = [1, 2, 3]
    XCTAssertNotNil(array[safeIndex: 0])
    XCTAssertEqual(array[safeIndex: 0], 1)
    XCTAssertNil(array[safeIndex: 99])
  }
}
