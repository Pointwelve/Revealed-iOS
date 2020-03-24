//
//  AppState.swift
//  Revealed
//
//  Created by KokHong on 24/3/20.
//  Copyright © 2020 Pointwelve. All rights reserved.
//

import Foundation
import Combine
import Auth0

class AppState: ObservableObject {
  
  enum UserState {
    case home
    case getStarted
    case postSignUp
    case new
  }
  
  private var disposables = Set<AnyCancellable>()
  
  @Published var userState = UserState.new
  
  init(auth: AuthService = AuthService.shared) {
    
    auth.credentialSubject
      .sink { [weak self] credential in
        if credential != nil {
          if self?.userState == .getStarted {
            self?.userState = .postSignUp
          } else {
            self?.userState = .home
          }
        } else {
          self?.userState = .getStarted
        }
      }.store(in: &disposables)

    auth.reAuth()
  }
  
  deinit {
    disposables.removeAll()
  }
}
