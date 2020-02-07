//
//  ContentViewModel.swift
//  Revealed
//
//  Created by Li Hao Lai on 6/2/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
  @Published var viewState: ContentView.State?
  private var disposables = Set<AnyCancellable>()
  private let queue = DispatchQueue(label: "com.pointwelve.revealed.contentViewQueue")

  @ObservedObject private var auth: AuthService = AuthService.shared

  init() {
    auth.$credentials.dropFirst().sink { [weak self] credential in
      if credential != nil {
        if self?.viewState == .getStarted {
          self?.viewState = .postSignUp
        } else {
          self?.viewState = .home
        }
      }
    }.store(in: &disposables)
  }

  deinit {
    disposables.removeAll()
  }
}
