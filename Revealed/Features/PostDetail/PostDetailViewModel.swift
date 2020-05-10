//
//  PostDetailViewModel.swift
//  Revealed
//
//  Created by KokHong on 24/3/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import Combine
import Foundation

final class PostDetailViewModel: ObservableObject {
  @Published var commentList: [CommentDetail] = []

  private var disposables = Set<AnyCancellable>()
  let postDetailOutput: PostDetailOutput
  let createCommentTrigger = PassthroughSubject<String, Never>()

  init(post: PostDetail) {
    let createdAt = Date(timeIntervalSince1970: Double(post.createdAt)).relativeDateString()
    // TODO: Change NTUC to organisation
    let header = "NTUC・\(post.author.username)・\(createdAt)"
    let totalCommentString = "\(post.totalCommentsCount > 1 ? "Comments" : "Comment")"
    postDetailOutput = PostDetailOutput(header: header,
                                        subject: post.subject,
                                        content: post.content,
                                        totalCommentCount: post.totalCommentsCount,
                                        totalCommentString: totalCommentString,
                                        replyPostText: "Reply to \(post.author.username)")

    // Fetch commnet list from server
    ApolloNetwork.shared.apollo.fetchFuture(query: GetCommentsQuery(postId: post.id, first: 10, after: nil),
                                            cachePolicy: .returnCacheDataElseFetch)
      .map {
        $0.getComments.edges?.map { $0.fragments.commentDetail } ?? []
      }
      .eraseToAnyPublisher()
      .replaceError(with: [])
      .sink(receiveCompletion: { value in
        switch value {
        case let .failure(error):
          debugPrint("Error: \(error)")
        case .finished:
          break
        }
      }, receiveValue: { [weak self] comment in
        self?.commentList.append(contentsOf: comment)
    })
      .store(in: &disposables)

    // Create commnet API
    createCommentTrigger.flatMap {
      ApolloNetwork.shared.apollo.mutateFuture(mutation: CreateCommentMutation(input: .init(postId: post.id, content: $0)))
      .map { Result<CommentDetail, CommentError>.success($0.createComment.fragments.commentDetail) }
      .eraseToAnyPublisher()
      .replaceError(with: Result<CommentDetail, CommentError>.failure(.requestError))
    }
    .sink(receiveCompletion: { value in
      switch value {
      case .finished:
        break
      }
    }, receiveValue: { [weak self] comment in
      switch comment {
      case let .success(detail):
        self?.commentList.insert(detail, at: 0)
      case let .failure(error):
        debugPrint(error)
      }
    })
    .store(in: &disposables)
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
