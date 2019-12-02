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
    // TODO: Use environment variable for URL.
    let url = URL(string: "http://localhost:8080/graphql")!
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
    // TODO: Set Authentication Header
  }
}
