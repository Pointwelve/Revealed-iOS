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
  @Published var posts: [PostDetail] = []
  private var disposables = Set<AnyCancellable>()
  private let queue = DispatchQueue(label: "com.pointwelve.revealed.postQueue")

  init() {
    refresh()

    let mutation = PostSignupMutation(input: .init(username: "AlvinChoo"))
    ApolloNetwork.shared.apollo.mutateFuture(mutation: mutation)
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case let .failure(error):
          debugPrint(error)
        case .finished:
          debugPrint("finish")
        }
      }) { (data) in
        debugPrint(data)
    }.store(in: &disposables)
  }

  deinit {
    disposables.removeAll()
  }

  func refresh() {
    let query = GetAllPostQuery(first: 10, commentFirst: "")
    ApolloNetwork.shared.apollo.fetchFuture(query: query, queue: queue)
      .map { $0.getAllPosts.edges?.compactMap { $0.fragments.postDetail } ?? [] }
      .eraseToAnyPublisher()
      .receive(on: DispatchQueue.main)
      .replaceError(with: [])
      .assign(to: \.posts, on: self)
      .store(in: &disposables)
  }
}
