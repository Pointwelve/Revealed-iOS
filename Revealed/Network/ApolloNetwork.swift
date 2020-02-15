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
    guard let idToken = AuthService.shared.idToken else {
      // TODO: reAuth
      return
    }

    request.addValue(idToken, forHTTPHeaderField: "Authorization")
  }
}

extension ApolloNetwork: HTTPNetworkTransportTaskCompletedDelegate {
  func networkTransport(_ networkTransport: HTTPNetworkTransport, didCompleteRawTaskForRequest request: URLRequest, withData data: Data?, response: URLResponse?, error: Error?) {
    guard let data = data,
      let object = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
      let body = request.httpBody,
      let requestBody = try? JSONSerialization.jsonObject(with: body, options: .allowFragments) else {
      return
    }

    // To debug server response and request
    debugPrint("Request Body \(requestBody)")
    debugPrint("Response \(object)")
  }
}
