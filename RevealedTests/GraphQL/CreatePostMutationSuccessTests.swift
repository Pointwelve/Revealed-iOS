//
//  CreatePostMutationSuccessTests.swift
//  RevealedTests
//
//  Created by KokHong on 17/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Apollo
import OHHTTPStubs
@testable import Revealed
import XCTest

class CreatePostMutationSuccessTests: XCTestCase {
  var mainStub: OHHTTPStubsDescriptor?
  override func setUp() {
    mainStub = stub(condition: isHost("localhost"), response: { (_) -> OHHTTPStubsResponse in
      let data = MockResponse.CreatePost.data(using: .utf8)!
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
    let input = PostInput(subject: "sample subject", content: "sample content", topicId: "topicId", tagIds: [])
    let cancellable = client.mutateFuture(mutation: CreatePostMutation(input: input))
      .sink(receiveCompletion: { value in
        switch value {
        case let .failure(error):
          XCTFail(error.localizedDescription)
        case .finished:
          break
        }
      }, receiveValue: { actual in
        let expeceted = PostDetail(author: .init(id: "f9Qyh",
                                                 username: "Aiden"),
                                   tags: [
                                     .init(name: "Human"),
                                     .init(name: "Office"),
                                     .init(name: "Other")
                                   ],
                                   topic: .init(name: "braid"),
                                   id: "W38KpkBxfj",
                                   excerpt: "The secular cooling that must someday overtake our planet has already gone far indeed with our neighbour.",
                                   subject: "He spoke of the happiness that was now certainly theirs, of the folly of not breaking sooner out of that magnificent prison of latter-day life, of the old romantic days that had passed from the world for ever.",
                                   createdAt: 1_523_735_771,
                                   totalLikesCount: 31,
                                   totalCommentsCount: 25,
                                   postViewCount: 60,
                                   status: .approved)
        XCTAssertEqual(actual.createPost.fragments.postDetail, expeceted)
        expec.fulfill()
      })

    waitForExpectations(timeout: timeout) { _ in
      XCTAssertNotNil(cancellable)
    }
  }
}
