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
        Text("-") // TODO: replace with organisation name
          .font(.caption)
      }
      .padding(.top, 3)
      .padding(.bottom, 8)

      Divider()
        .padding(.bottom, 8)

      ToolbarView(leftItems: [
        ToolBarItem(iconName: "arrow.up", title: "\(post.totalLikesCount)", isSelected: false, action: {}),
        ToolBarItem(iconName: "clock.fill", title: "\(post.postViewCount)", isSelected: false, action: {}),
        ToolBarItem(iconName: "text.bubble.fill", title: "\(post.totalCommentsCount)", isSelected: false, action: {})
      ], rightItems: [
        ToolBarItem(iconName: "bookmark.fill", title: "", isSelected: false, action: {})
      ])
    }.buttonStyle(PlainButtonStyle())
  }
}

struct ToolBarItem: ToolbarItemModel {
  var iconName: String

  var title: String

  var isSelected: Bool

  var action: Action?
}

struct PostRow_Previews: PreviewProvider {
  static var previews: some View {
    PostRow(post: PostDetail.mock)
  }
}
