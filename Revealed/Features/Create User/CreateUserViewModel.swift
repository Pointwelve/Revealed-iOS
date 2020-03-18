//
//  CreateUserViewModel.swift
//  Revealed
//
//  Created by Li Hao Lai on 15/3/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import Apollo
import Foundation
import Combine
import SwiftUI

class CreateUserViewModel: ObservableObject {
  let createUserSubject = PassthroughSubject<PostSignupInput, Error>()

  @Published var userDetail: UserDetail?

  private var disposables = Set<AnyCancellable>()
  private let queue = DispatchQueue(label: "com.pointwelve.revealed.createUserQueue")

  init() {
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
    .assign(to: \.userDetail, on: self)
    .store(in: &disposables)
  }
}
