//
//  PostDetailViewModel.swift
//  Revealed
//
//  Created by KokHong on 24/3/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import Combine
import Foundation

struct PostDetailViewModel {

  let postDetailOutput: PostDetailOutput

  init(post: PostDetail) {
    let createdAt = Date(timeIntervalSince1970: Double(post.createdAt)).relativeDateString()
    // TODO: Change NTUC to organisation
    let header = "NTUC・\(post.author.username)・\(createdAt)"
    let totalCommentString = "\(post.totalCommentsCount > 1 ? "Comments" : "Comment")"
    self.postDetailOutput = PostDetailOutput(header: header,
                                             subject: post.subject,
                                             content: post.content,
                                             totalCommentCount: post.totalCommentsCount,
                                             totalCommentString: totalCommentString,
                                             replyPostText: "Reply to \(post.author.username)")
  }
}
extension PostDetailViewModel {
  struct PostDetailOutput {
    let header: String
    let subject: String
    let content: String
    let totalCommentCount: Int
    let totalCommentString: String
    let replyPostText: String
  }
}
