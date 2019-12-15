//
import Apollo
//  CombineFutureFailureTests.swift
//  RevealedTests
//
//  Created by Hong on 14/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//
import OHHTTPStubs
@testable import Revealed
import XCTest

class CombineFutureFailureTests: XCTestCase {
  var mainStub: OHHTTPStubsDescriptor?
  override func setUp() {
    mainStub = stub(condition: isHost("localhost"), response: { (_) -> OHHTTPStubsResponse in
      let data = MockResponse.GetAllPost.data(using: .utf8)!
      let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
      return OHHTTPStubsResponse(jsonObject: json, statusCode: 500, headers: nil)
    })

    super.setUp()
  }

  override func tearDown() {
    if let stub = mainStub {
      OHHTTPStubs.removeStub(stub)
    }
    super.tearDown()
  }

  func testFetchQueryFail() {
    let expec = expectation(description: "Async Future")
    let client = ApolloClient(url: URL(string: "https://localhost:8080")!)
    let cancellable = client.fetchFuture(query: GetAllPostQuery(first: 10, commentFirst: ""), cachePolicy: .fetchIgnoringCacheData)
      .sink(receiveCompletion: { value in
        switch value {
        case let .failure(error):
          XCTAssertNotNil(error as? GraphQLHTTPResponseError)
          expec.fulfill()
        case .finished:
          break
        }
      }, receiveValue: { _ in
        XCTFail("500 shouldn't receive results")
      })

    waitForExpectations(timeout: timeout) { _ in
      XCTAssertNotNil(cancellable)
    }
  }
}
