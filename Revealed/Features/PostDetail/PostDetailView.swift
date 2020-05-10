//
//  PostDetailView.swift
//  Revealed
//
//  Created by KokHong on 24/3/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import SwiftUI

struct PostDetailView: View {
  @State var createCommentPresented = false
  @State var commentText = ""
  let padding = CGFloat.padding
  let viewModel: PostDetailViewModel
  let horizontalPadding: Edge.Set = [.leading, .trailing]

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
      }.padding(horizontalPadding, padding)

      CommentCountView(count: viewModel.postDetailOutput.totalCommentCount,
                       commentText: viewModel.postDetailOutput.totalCommentString)
      
      CommentListViewControllerRepresentable(commentList: self.viewModel.$commentList)

      Button(viewModel.postDetailOutput.replyPostText) {
        self.createCommentPresented.toggle()
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 51.0,
             alignment: .topLeading)
      .padding(padding)
      .background(Color.white94).shadow(color: Color.black30, radius: -0.5, x: 0, y: 0)
      .font(.body)
      .foregroundColor(.secondary)
      .sheet(isPresented: $createCommentPresented) {
        CreateCommentView(replyText: self.viewModel.postDetailOutput.replyPostText) { comment in
          self.createCommentPresented.toggle()
          guard let comment = comment else { return }
          self.viewModel.createCommentTrigger.send(comment)
        }
      }.visualEffect(.system)
    }
    .padding(.top, padding)
    .edgesIgnoringSafeArea(.bottom)
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
