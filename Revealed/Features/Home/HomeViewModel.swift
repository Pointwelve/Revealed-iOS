//
//  HomeViewModel.swift
//  Revealed
//
//  Created by Hong on 10/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject, Identifiable {
  @Published var posts: [Post] = []
  private var disposables = Set<AnyCancellable>()
  private let queue = DispatchQueue(label: "com.pointwelve.revealed.postQueue")

  init() {
    refresh()
  }

  deinit {
    disposables.removeAll()
  }

  func refresh() {
    let query = GetAllPostQuery(first: 10, commentFirst: "")
    ApolloNetwork.shared.apollo.fetchFuture(query: query, queue: queue)
      .map { $0.getAllPosts.edges?.compactMap { $0 } ?? [] }
      .eraseToAnyPublisher()
      .receive(on: DispatchQueue.main)
      .replaceError(with: [])
      .assign(to: \.posts, on: self)
      .store(in: &disposables)
  }
}
