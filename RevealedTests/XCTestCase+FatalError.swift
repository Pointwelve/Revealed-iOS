//
//  XCTestCase+FatalError.swift
//  RevealedTests
//
//  Created by Hong on 12/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//
@testable import Revealed
import XCTest
extension XCTestCase {
  func expectFatalError(expectedMessage: String, testcase: @escaping () -> Void) {
    let expectation = self.expectation(description: "expectingFatalError")
    var assertionMessage: String?
    RevealedError.replaceFatalError { message, _, _ in
      assertionMessage = message
      expectation.fulfill()
      self.unreachable()
    }
    DispatchQueue.global(qos: .userInitiated).async(execute: testcase)
    waitForExpectations(timeout: 2) { _ in
      XCTAssertEqual(assertionMessage, expectedMessage)
      RevealedError.restoreFatalError()
    }
  }

  private func unreachable() -> Never {
    repeat {
      RunLoop.current.run()
    } while true
  }
}
