//
//  PostRow.swift
//  Revealed
//
//  Created by Hong on 10/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import SwiftUI

struct PostRow: View {
  let post: Post
  var body: some View {
    VStack(alignment: .leading, spacing: 20.0) {
      Text("Subject: \(post.subject)")
        .fontWeight(.heavy)
      Text("Content: \(post.content)")
      Text("Author: \(post.author.id)")
        .fontWeight(.bold)
    }
  }
}

struct PostRow_Previews: PreviewProvider {
  static var previews: some View {
    PostRow(post: Post(author: .init(id: "author"),
                       tags: nil,
                       topic: .init(name: "topic"),
                       content: "Sample Content",
                       subject: "Sample Subject",
                       createdAt: "now",
                       totalLikesCount: 10,
                       totalCommentsCount: 20,
                       postViewCount: 30,
                       status: .new))
  }
}
