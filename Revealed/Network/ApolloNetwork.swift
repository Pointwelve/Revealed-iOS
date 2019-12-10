//
//  Apollo.swift
//  Revealed
//
//  Created by Hong on 30/11/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Apollo
import Foundation

final class ApolloNetwork {
  static let shared = ApolloNetwork()

  // Configure the network transport to use the singleton as the delegate.
  private let session = URLSession(configuration: .default)
  private(set) lazy var apollo: ApolloClient = {
    let url = URL(string: Config.shared.configuration.host)!
    return ApolloClient(networkTransport: HTTPNetworkTransport(url: url,
                                                               session: session,
                                                               delegate: self))
  }()
}

extension ApolloNetwork: HTTPNetworkTransportPreflightDelegate {
  func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
    return true
  }

  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                        willSend request: inout URLRequest) {
    // TODO: Change to pass Auth0 Access Token here
    request.addValue("eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6Ik9EaEdNVUZFT0RCRFJqazBSVEkwTnpKRVJUazRNa1pGTmpNeVJUVkNNRGhDUTBNME9FRkdNZyJ9.eyJpc3MiOiJodHRwczovL3BvaW50d2VsdmUuYXUuYXV0aDAuY29tLyIsInN1YiI6Im9HRVFPTzJpc1RDWUNtTW1vZ2tsRjFueUZGVFc4MDZFQGNsaWVudHMiLCJhdWQiOiJodHRwczovL3JldmVhbGVkLnBvaW50d2VsdmUuY29tIiwiaWF0IjoxNTc1OTg3NzY0LCJleHAiOjE1NzYwNzQxNjQsImF6cCI6Im9HRVFPTzJpc1RDWUNtTW1vZ2tsRjFueUZGVFc4MDZFIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIn0.HePJ7fqaCJ9Ucsg_KxMKfM0acQ8yzmF3rosdMLeZmydgN4rKsZWiaJ7s4beczWbVL_q33alqovKZEJYBwbzNXCKbVJO8o2H5U2exBI4jku-j1h4RTJLuFjoalM3ToUF8lx5puPFKRsEPg0GDfLMhAis29RbbKybMnvcwSYPGZVdIvtpKUfTTzjXKxFQ-RrIIJjeBxaz-z31wMfCEcddUwW5HrWVZeKOcS9dQd2txBM0EomcSXEbjfM_JGGzsRiZNvuxglUA7P-XtyOu7ELRDuW3zNZV92R3N0fka-u91k4fc_FWf36RgUaKgT3a_DY4PzkOfWsSaiXrNrpj8R_UhlQ", forHTTPHeaderField: "Authorization")
  }
}
