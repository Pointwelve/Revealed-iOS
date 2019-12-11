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
      Text(post.topic.name)
        .padding()
        .background(Color(UIColor.lightGray))
        .cornerRadius(25)

      Text(post.subject)
        .font(.title)

      Text(post.excerpt)
        .font(.body)
        .foregroundColor(Color(UIColor.lightGray))

      HStack(alignment: .top, spacing: 15.0) {
        Text(post.author.username)
          .font(.footnote)
        Text("•")
          .font(.footnote)
        Text(post.author.id)
          .font(.footnote)
      }
      Divider()

      HStack(alignment: .top, spacing: 15.0) {
        HStack(alignment: .center, spacing: 5.0) {
          Image(systemName: "eye.fill")
          Text("\(post.postViewCount)")
        }

        HStack(alignment: .center, spacing: 5.0) {
          Image(systemName: "hand.thumbsup")
          Text("\(post.totalLikesCount)")
        }

        HStack(alignment: .center, spacing: 5.0) {
          Image(systemName: "text.bubble")
          Text("\(post.totalCommentsCount)")
        }
      }
    }
  }
}

struct PostRow_Previews: PreviewProvider {
  static var previews: some View {
    PostRow(post: Post(author: .init(id: "author", username: "author name"),
                       tags: nil,
                       topic: .init(name: "topic"),
                       id: "123",
                       excerpt: "Sample excerpt",
                       subject: "Sample Subject",
                       createdAt: "now",
                       totalLikesCount: 10,
                       totalCommentsCount: 20,
                       postViewCount: 30,
                       status: .new))
  }
}
