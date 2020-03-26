//
//  Post+Domain.swift
//  Revealed
//
//  Created by KokHong on 13/1/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import Foundation

extension PostDetail: Identifiable {}

extension PostDetail {
  static let mock = PostDetail(author: .init(id: "author", username: "author name"),
                               tags: nil,
                               topic: .init(name: "topic"),
                               id: "123",
                               content: "Sample Content",
                               excerpt: "Sample excerpt",
                               subject: "Sample Subject",
                               createdAt: 1000,
                               totalLikesCount: 10,
                               totalCommentsCount: 20,
                               postViewCount: 30,
                               status: .new)
}
