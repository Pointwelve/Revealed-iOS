//
//  CreateCommentView.swift
//  Revealed
//
//  Created by KokHong on 10/5/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import SwiftUI

struct CreateCommentView: View {
  let replyText: String
  let onCommit: (String?) -> Void
  @State var comment: String = ""
  var body: some View {
    VStack {
      MultilineTextField(replyText, text: $comment) {
         self.onCommit(self.comment)
       }
      Spacer()
    }.padding(20)
  }
}

struct CreateCommentView_Previews: PreviewProvider {
  static var previews: some View {
    CreateCommentView(replyText: "Reply text") { _ in }
  }
}
