//
//  CreatePostViewModel.swift
//  Revealed
//
//  Created by KokHong on 24/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//
import Apollo
import Combine
import Foundation
import SwiftUI

typealias Topic = GetAllConfigsQuery.Data.GetAllTopic.Edge
typealias Tag = GetAllConfigsQuery.Data.GetAllTag.Edge

extension Tag: Identifiable {}

extension Topic: Identifiable {}

struct TopicAndTag {
  let topics: [Topic]
  let tags: [Tag]

  static let `default` = TopicAndTag(topics: [], tags: [])
}

class CreatePostViewModel: ObservableObject {
  let createPostSubject = PassthroughSubject<PostInput, Error>()

  @Published var topicAndTag: TopicAndTag = TopicAndTag.default
  @Published var newPost: PostDetail?

  private var disposables = Set<AnyCancellable>()
  private let queue = DispatchQueue(label: "com.pointwelve.revealed.createPostQueue")

  init() {
    ApolloNetwork.shared.apollo.fetchFuture(query: GetAllConfigsQuery(),
                                            cachePolicy: .returnCacheDataElseFetch,
                                            queue: queue)
      .map { data -> TopicAndTag in
        let tags = data.getAllTags?.edges?.compactMap { $0 } ?? []
        let topics = data.getAllTopics?.edges?.compactMap { $0 } ?? []
        return TopicAndTag(topics: topics, tags: tags)
      }
      .eraseToAnyPublisher()

      .replaceError(with: TopicAndTag.default)
      .receive(on: DispatchQueue.main)
      .assign(to: \.topicAndTag, on: self)
      .store(in: &disposables)

    createPostSubject.flatMap {
      ApolloNetwork.shared.apollo.mutateFuture(mutation: CreatePostMutation(input: $0), queue: self.queue)
    }
    .map { $0.createPost?.fragments.postDetail }
    .eraseToAnyPublisher()
    .replaceError(with: nil)
    .receive(on: DispatchQueue.main)
    .assign(to: \.newPost, on: self)
    .store(in: &disposables)
  }

  deinit {
    disposables.removeAll()
  }
}
