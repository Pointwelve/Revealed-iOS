//
//  HomeViewModel.swift
//  Revealed
//
//  Created by Hong on 10/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Combine
import Foundation

typealias Post = GetAllPostQuery.Data.GetAllPost.Edge

extension Post: Identifiable {
  public var id: String {
    return fragments.postDetail.id
  }
}

class HomeViewModel: ObservableObject, Identifiable {
  @Published var posts: [Post] = []
  private var disposables = Set<AnyCancellable>()
  private let queue = DispatchQueue(label: "com.pointwelve.revealed.postQueue")

  init() {
    refresh()
  }

  func refresh() {
    let query = GetAllPostQuery(first: 10, commentFirst: "")
    ApolloNetwork.shared.apollo.fetchFuture(query: query, queue: queue)
      .map { $0.getAllPosts?.edges?.compactMap { $0 } ?? [] }
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { [weak self] value in
        guard let self = self else { return }
        switch value {
        case .failure:
          self.posts = []
        case .finished:
          break
        }
      }, receiveValue: { [weak self] posts in
        guard let self = self else { return }
        self.posts = posts
      })
      .store(in: &disposables)
  }
}
