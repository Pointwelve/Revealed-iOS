//
//  AuthService.swift
//  Revealed
//
//  Created by James Lai on 13/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Auth0
import Foundation

final class AuthService {
  static let shared = AuthService()

  private let authentication: Authentication

  private let credentialsManager: CredentialsManager

  private var credentials: Credentials?

  var idToken: String? {
    return credentials?.idToken
  }

  private init() {
    authentication = Auth0.authentication()
    credentialsManager = CredentialsManager(authentication: authentication)

    _ = authentication.logging(enabled: true) // API Logging
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
