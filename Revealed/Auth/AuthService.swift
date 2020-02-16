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

  private var credentials: Credentials? {
    didSet {
      credentialSubject.send(credentials)
    }
  }

  let credentialSubject = PassthroughSubject<Credentials?, Never>()

  var idToken: String? {
    return credentials?.idToken
  }

  private init() {
    authentication = Auth0.authentication()
    credentialsManager = CredentialsManager(authentication: authentication)

    _ = authentication.logging(enabled: true) // API Logging
  }

  func reAuth() {
    guard credentialsManager.hasValid() else {
      credentials = nil
      return
    }

    credentialsManager.credentials(callback: { [weak self] _, credentials in
      // TODO: Ideally, create combine interface for Auth0 SDK and use `receive(on:)`
      DispatchQueue.main.async {
        self?.credentials = credentials
      }
    })
  }

  func logout() {
    credentials = nil
    credentialsManager.revoke { _ in
      // TODO: Handle Error
    }
  }

  func store(credentials: Credentials) {
    // TODO: Ideally, create combine interface for Auth0 SDK and use `receive(on:)`
    DispatchQueue.main.async { [weak self] in
      self?.credentials = credentials
    }

    _ = credentialsManager.store(credentials: credentials)
  }
}
