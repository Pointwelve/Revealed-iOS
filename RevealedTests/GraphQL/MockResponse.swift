//
//  MockResponse.swift
//  RevealedTests
//
//  Created by Hong on 14/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Foundation
enum MockResponse {
  static let GetAllPost = """
  {
      "data": {
          "getAllPosts": {
              "__typename": "PostConnection",
              "edges": [
                  {
                      "__typename": "Post",
                      "author": {
                          "__typename": "User",
                          "id": "f9Qyh",
                          "username": "Aiden"
                      },
                      "tags": [
                          {
                              "__typename": "Tag",
                              "name": "Human"
                          },
                          {
                              "__typename": "Tag",
                              "name": "Office"
                          },
                          {
                              "__typename": "Tag",
                              "name": "Other"
                          }
                      ],
                      "topic": {
                          "__typename": "Topic",
                          "name": "braid"
                      },
                      "id": "W38KpkBxfj",
                      "content": "The secular cooling that must someday overtake our planet has already gone far indeed with our neighbour.",
                      "excerpt": "The secular cooling that must someday overtake our planet has already gone far indeed with our neighbour.",
                      "subject": "He spoke of the happiness that was now certainly theirs, of the folly of not breaking sooner out of that magnificent prison of latter-day life, of the old romantic days that had passed from the world for ever.",
                      "createdAt": 1523735771,
                      "totalLikesCount": 31,
                      "totalCommentsCount": 25,
                      "postViewCount": 60,
                      "status": "APPROVED"
                  },
                  {
                      "__typename": "Post",
                      "author": {
                          "__typename": "User",
                          "id": "LC8rn",
                          "username": "Anthony"
                      },
                      "tags": [
                          {
                              "__typename": "Tag",
                              "name": "Other"
                          },
                          {
                              "__typename": "Tag",
                              "name": "Other"
                          },
                          {
                              "__typename": "Tag",
                              "name": "Politics"
                          }
                      ],
                      "topic": {
                          "__typename": "Topic",
                          "name": "ray"
                      },
                      "id": "fd8SiDIBZE",
                      "content": "The secular cooling that must someday overtake our planet has already gone far indeed with our neighbour.",
                      "excerpt": "He completely abandoned the child of his marriage with Adelaida Ivanovna, not from malice, nor because of his matrimoni- al grievances, but simply because he forgot him.",
                      "subject": "The sun set; the dusk fell on the stream, and lights began to appear along the shore. The Chapman light–house, a three–legged thing erect on a mud–flat, shone strongly.",
                      "createdAt": 1398160344,
                      "totalLikesCount": 76,
                      "totalCommentsCount": 93,
                      "postViewCount": 60,
                      "status": "APPROVED"
                  }
              ],
              "pageInfo": {
                  "__typename": "PageInfo",
                  "hasNextPage": false,
                  "endCursor": "6zeR0"
              }
          }
      }
  }
  """

  static let CreatePost = """
  {
      "data": {
          "createPost": {
              "__typename": "Post",
              "author": {
                  "__typename": "User",
                  "id": "f9Qyh",
                  "username": "Aiden"
              },
              "tags": [
                  {
                      "__typename": "Tag",
                      "name": "Human"
                  },
                  {
                      "__typename": "Tag",
                      "name": "Office"
                  },
                  {
                      "__typename": "Tag",
                      "name": "Other"
                  }
              ],
              "topic": {
                  "__typename": "Topic",
                  "name": "braid"
              },
              "id": "W38KpkBxfj",
              "content": "The secular cooling that must someday overtake our planet has already gone far indeed with our neighbour.",
              "excerpt": "The secular cooling that must someday overtake our planet has already gone far indeed with our neighbour.",
              "subject": "He spoke of the happiness that was now certainly theirs, of the folly of not breaking sooner out of that magnificent prison of latter-day life, of the old romantic days that had passed from the world for ever.",
              "createdAt": 1523735771,
              "totalLikesCount": 31,
              "totalCommentsCount": 25,
              "postViewCount": 60,
              "status": "APPROVED"
          }
      }
  }
  """

  static let PostSignup = """
  {
    "data": {
      "postSignup": {
        "__typename": "PostSignupResponse",
        "user": {
          "__typename": "User",
          "email": "kokhong@pointwelve.com",
          "id": "b623b7fa-075c-4432-b235-81c6e64590fa",
          "username": "Alvin"
        }
      }
    }
  }
  """
}
