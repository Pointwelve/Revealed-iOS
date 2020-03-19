//
//  PostRow.swift
//  Revealed
//
//  Created by Hong on 10/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import SwiftUI

struct PostRow: View {
  let post: PostDetail
  var body: some View {
    VStack(alignment: .leading) {
//      Text(post.topic.name)
//        .padding()
//        .background(Color(UIColor.lightGray))
//        .cornerRadius(25)

      Text(post.subject)
        .font(.headline)
        .padding(.bottom, 5)

      Text(post.excerpt)
        .font(.subheadline)
        .foregroundColor(Color(UIColor.lightGray))
        .padding(.bottom, 10)

      HStack(alignment: .top, spacing: 4.0) {
        Text(post.author.username)
          .font(.caption)
        Text("・")
          .font(.caption)
        Text(post.author.id)
          .font(.caption)
      }
      .padding(.top, 3)
      .padding(.bottom, 8)

      Divider()
        .padding(.bottom, 8)

      HStack(alignment: .center, spacing: 8.0) {
        HStack(alignment: .center, spacing: 4.0) {
          Image(systemName: "arrow.up")
             .font(.system(size: 12.0))

          Text("\(post.postViewCount)")
            .font(.caption)
        }

        HStack(alignment: .center, spacing: 4.0) {
          Image(systemName: "clock.fill")
            .font(.system(size: 12.0))

          Text("\(post.totalLikesCount)")
            .font(.caption)
        }

        HStack(alignment: .center, spacing: 4.0) {
          Image(systemName: "text.bubble.fill")
            .font(.system(size: 12.0))

          Text("\(post.totalCommentsCount)")
            .font(.caption)
        }

        Spacer()

        Image(systemName: "bookmark.fill")
          .font(.system(size: 12.0))
      }

      Divider()
        .padding(.top, 5)
    }
  }
}

struct PostRow_Previews: PreviewProvider {
  static var previews: some View {
    PostRow(post: PostDetail.mock)
  }
}
