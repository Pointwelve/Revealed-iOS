//
//  Post+Domain.swift
//  Revealed
//
//  Created by KokHong on 13/1/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import Foundation

typealias Post = GetAllPostQuery.Data.GetAllPost.Edge

extension Post: Identifiable {
  public var id: String {
    return fragments.postDetail.id
  }
}

extension PostDetail {
  static let shared = PostDetail(author: .init(id: "author", username: "author name"),
                                 tags: nil,
                                 topic: .init(name: "topic"),
                                 id: "123",
                                 excerpt: "Sample excerpt",
                                 subject: "Sample Subject",
                                 createdAt: 1000,
                                 totalLikesCount: 10,
                                 totalCommentsCount: 20,
                                 postViewCount: 30,
                                 status: .new)
}
