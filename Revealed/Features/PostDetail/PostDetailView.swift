//
//  PostDetailView.swift
//  Revealed
//
//  Created by KokHong on 24/3/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import SwiftUI

struct PostDetailView: View {
  let post: PostDetail
  let padding = CGFloat.padding
  let leadTrailingEdges: Edge.Set = [.leading, .trailing]

  init(post: PostDetail) {
    self.post = post
  }

  var body: some View {
    VStack(alignment: HorizontalAlignment.leading, spacing: padding) {
      // Header Text
      //TODO: Change NTUC to organisation
      Text("""
      NTUC・\(post.author.username)\
      ・\(Date(timeIntervalSince1970: Double(post.createdAt)).relativeDateString)
      """).font(.caption).padding(leadTrailingEdges, padding)

      // Subject
      Text(post.subject).font(.title).lineLimit(2).padding(leadTrailingEdges, padding)

      // Content
      Text(post.content).font(.body).foregroundColor(.charcoalGrey60).padding(leadTrailingEdges, padding)

      CommentCountView(count: post.totalCommentsCount)

      Spacer()
    }.padding([.top, .bottom], padding)
      .navigationBarTitle("", displayMode: .inline)
      .navigationBarItems(trailing: Button(action: {}) {
        Image(systemName: "bookmark.fill").foregroundColor(.black)
    })
  }
}

extension PostDetailView {
  struct CommentCountView: View {
    let count: Int
    var body: some View {
      (Text("\(count) ").font(.system(size: 12, weight: .bold, design: .default))
        + Text("\(count > 1 ? "Comments" : "Comment")").font(.caption))
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .padding(CGFloat.padding)
        .background(Color.battleshipGrey5)
    }
  }
}

struct PostDetail_Previews: PreviewProvider {
  static var previews: some View {
    PostDetailView(post: .mock)
  }
}
