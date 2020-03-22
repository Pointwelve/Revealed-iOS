//
//  CreateUserMutationFailureTests.swift
//  RevealedTests
//
//  Created by Li Hao Lai on 22/3/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import Apollo
import OHHTTPStubs
@testable import Revealed
import XCTest

class CreateUserMutationFailureTests: XCTestCase {
  var mainStub: OHHTTPStubsDescriptor?
  override func setUp() {
    mainStub = stub(condition: isHost("localhost"), response: { (_) -> OHHTTPStubsResponse in
      let data = MockResponse.PostSignup.data(using: .utf8)!
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
    let input = PostSignupInput(username: "Alvin")
    let cancellable = client.mutateFuture(mutation: PostSignupMutation(input: input))
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
