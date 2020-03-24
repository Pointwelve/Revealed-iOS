//
//  CreateUserViewModel.swift
//  Revealed
//
//  Created by Li Hao Lai on 15/3/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import Apollo
import Combine
import Foundation
import SwiftUI

class CreateUserViewModel: ObservableObject {
  let createUserSubject = PassthroughSubject<PostSignupInput, Error>()

  private var disposables = Set<AnyCancellable>()
  private let queue = DispatchQueue(label: "com.pointwelve.revealed.createUserQueue")

  init(appState: AppState) {
    // Create user subscription
    createUserSubject.flatMap {
      ApolloNetwork.shared.apollo.mutateFuture(mutation: PostSignupMutation(input: $0), queue: self.queue)
    }
    .map {
      $0.postSignup.user.fragments.userDetail
    }
    .eraseToAnyPublisher()
    .replaceError(with: nil)
    .filter { $0 != nil }
    .receive(on: DispatchQueue.main)
    .sink(receiveValue: { _ in
      appState.userState = .home
    })
    .store(in: &disposables)
  }
}
