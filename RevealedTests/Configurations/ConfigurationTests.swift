//
//  ConfigurationTests.swift
//  RevealedTests
//
//  Created by Hong on 12/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//
@testable import Revealed
import XCTest

class ConfigurationTests: XCTestCase {
  func testConfigurationEquality() {
    let configuration = Configuration(host: "host")
    XCTAssert(configuration.host == "host")
  }

  func testConfigParseEquality() {
    let config = Config(fileName: "GraphQLTest", bundle: Bundle(for: ConfigurationTests.self))
    XCTAssertEqual(config.configuration.host, "https://localhost:8080")
  }

  func testConfigParseFileMissing() {
    expectFatalError(expectedMessage: Configuration.Error.fileMissing.localizedDescription) {
      _ = Config(fileName: "missing", bundle: Bundle(for: ConfigurationTests.self))
    }
  }

  func testConfigParseIncorrectKey() {
    expectFatalError(expectedMessage: Configuration.Error.incorrectKey.localizedDescription) {
      _ = Config(fileName: "GraphQLTestError", bundle: Bundle(for: ConfigurationTests.self))
    }
  }
}
