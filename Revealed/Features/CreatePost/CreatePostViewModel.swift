//
import Apollo
//  CreatePostViewModel.swift
//  Revealed
//
//  Created by KokHong on 24/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//
import Combine
import Foundation

typealias Topic = GetAllConfigsQuery.Data.GetAllTopic.Edge
typealias Tag = GetAllConfigsQuery.Data.GetAllTag.Edge

extension Tag: Identifiable {
  static let `default` = Tag(id: "default", name: "Choose Tag")
}

extension Topic: Identifiable {
  static let `default` = Topic(id: "default", name: "Choose Topic")
}

class CreatePostViewModel: ObservableObject {
  let createPostSubject = PassthroughSubject<PostInput, Error>()
  @Published var tags: [Tag]
  @Published var topics: [Topic]
  @Published var newPost: PostDetail?

  private var disposables = Set<AnyCancellable>()
  private let queue = DispatchQueue(label: "com.pointwelve.revealed.createPostQueue")

  init(topics: [Topic] = [], tags: [Tag] = []) {
    self.topics = topics
    self.tags = tags
    ApolloNetwork.shared.apollo.fetchFuture(query: GetAllConfigsQuery(),
                                            cachePolicy: .returnCacheDataElseFetch,
                                            queue: queue)
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { [weak self] value in
        guard let self = self else { return }
        switch value {
        case .failure:
          self.tags = []
          self.topics = []
        case .finished:
          break
        }
      }, receiveValue: { [weak self] data in
        guard let self = self else { return }
        self.tags = data.getAllTags?.edges?.compactMap { $0 } ?? []
        self.topics = data.getAllTopics?.edges?.compactMap { $0 } ?? []

      })
      .store(in: &disposables)

    createPostSubject.flatMap {
      ApolloNetwork.shared.apollo.mutateFuture(mutation: CreatePostMutation(input: $0), queue: self.queue)
    }
    .receive(on: DispatchQueue.main)
    .sink(receiveCompletion: { [weak self] value in
      guard let self = self else { return }
      switch value {
      case .failure:
        self.newPost = nil
      case .finished:
        self.newPost = nil
      }
    }, receiveValue: { [weak self] post in
      guard let self = self else { return }
      self.newPost = post.createPost?.fragments.postDetail

    })
    .store(in: &disposables)
  }
  deinit {
    disposables.removeAll()
  }
}
