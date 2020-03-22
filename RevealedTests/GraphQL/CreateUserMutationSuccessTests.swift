//
//  CreateUserMutationSuccessTests.swift
//  RevealedTests
//
//  Created by Li Hao Lai on 22/3/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import Apollo
import OHHTTPStubs
@testable import Revealed
import XCTest

class CreateUserMutationSuccessTests: XCTestCase {
  var mainStub: OHHTTPStubsDescriptor?
  override func setUp() {
    mainStub = stub(condition: isHost("localhost"), response: { (_) -> OHHTTPStubsResponse in
      let data = MockResponse.PostSignup.data(using: .utf8)!
      let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
      return OHHTTPStubsResponse(jsonObject: json, statusCode: 200, headers: nil)
    })

    super.setUp()
  }

  override func tearDown() {
    if let stub = mainStub {
      OHHTTPStubs.removeStub(stub)
    }
    super.tearDown()
  }

  func testFetchQuerySuccess() {
    let expec = expectation(description: "Async Future")
    let client = ApolloClient(url: URL(string: "https://localhost:8080")!)
    let input = PostSignupInput(username: "Alvin")
    let cancellable = client.mutateFuture(mutation: PostSignupMutation(input: input))
      .sink(receiveCompletion: { value in
        switch value {
        case let .failure(error):
          XCTFail(error.localizedDescription)
        case .finished:
          break
        }
      }, receiveValue: { actual in
        let expeceted = UserDetail(id: "b623b7fa-075c-4432-b235-81c6e64590fa",
                                   email: "kokhong@pointwelve.com",
                                   username: "Alvin")
        XCTAssertEqual(actual.postSignup.user.fragments.userDetail, expeceted)
        expec.fulfill()
      })

    waitForExpectations(timeout: timeout) { _ in
      XCTAssertNotNil(cancellable)
    }
  }
}
