//
//  AuthService.swift
//  Revealed
//
//  Created by James Lai on 13/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Auth0
import Combine
import Foundation

final class AuthService: ObservableObject {
  static let shared = AuthService()

  private let authentication: Authentication

  private let credentialsManager: CredentialsManager

  @Published private(set) var credentials: Credentials?

  var idToken: String? {
    return credentials?.idToken
  }

  private init() {
    authentication = Auth0.authentication()
    credentialsManager = CredentialsManager(authentication: authentication)

    _ = authentication.logging(enabled: true) // API Logging

    guard credentialsManager.hasValid() else {
      return
    }

    credentialsManager.credentials(callback: { [weak self] _, credentials in
      self?.credentials = credentials
    })
  }

  func logout() {
    credentials = nil
    credentialsManager.revoke { _ in
      // TODO: Handle Error
    }
  }

  func store(credentials: Credentials) {
    self.credentials = credentials
    _ = credentialsManager.store(credentials: credentials)
  }
}
