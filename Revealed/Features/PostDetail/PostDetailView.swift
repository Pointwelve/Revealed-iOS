//
//  PostDetailView.swift
//  Revealed
//
//  Created by KokHong on 24/3/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import SwiftUI

struct PostDetailView: View {
  let padding = CGFloat.padding
  let viewModel: PostDetailViewModel

  var body: some View {
    VStack(alignment: .leading, spacing: padding) {
      // Header Text
      // TODO: Change NTUC to organisation
      Group {
        Text(viewModel.postDetailOutput.header).font(.caption)

        // Subject
        Text(viewModel.postDetailOutput.subject).font(.title).lineLimit(2)

        // Content
        Text(viewModel.postDetailOutput.content).font(.body)
          .foregroundColor(.secondary)
      }.padding([.leading, .trailing], padding)

      CommentCountView(count: viewModel.postDetailOutput.totalCommentCount,
                       commentText: viewModel.postDetailOutput.totalCommentString)

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
    let commentText: String
    var body: some View {
      (Text("\(count) ").font(.system(size: 12, weight: .bold, design: .default))
        + Text(commentText).font(.caption))
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .padding(CGFloat.padding)
        .background(Color.battleshipGrey5)
    }
  }
}

struct PostDetail_Previews: PreviewProvider {
  static var previews: some View {
    PostDetailView(viewModel: .init(post: .mock))
  }
}
