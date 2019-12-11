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
    request.addValue("eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6Ik9EaEdNVUZFT0RCRFJqazBSVEkwTnpKRVJUazRNa1pGTmpNeVJUVkNNRGhDUTBNME9FRkdNZyJ9.eyJpc3MiOiJodHRwczovL3BvaW50d2VsdmUuYXUuYXV0aDAuY29tLyIsInN1YiI6Im9HRVFPTzJpc1RDWUNtTW1vZ2tsRjFueUZGVFc4MDZFQGNsaWVudHMiLCJhdWQiOiJodHRwczovL3JldmVhbGVkLnBvaW50d2VsdmUuY29tIiwiaWF0IjoxNTc2MDc1MjQ1LCJleHAiOjE1NzYxNjE2NDUsImF6cCI6Im9HRVFPTzJpc1RDWUNtTW1vZ2tsRjFueUZGVFc4MDZFIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIn0.ZtSHxjH1iQEnT8n4RcOpG1KvifipQISrEVaoCAximEQQmCebGl_H0YzVd7VkHFymQGHAq7Ctv_zJdjc4fr5uYzo8Kh_Z4f5U55KU2XZ4KV4GP4AAlCmeEsdm9lu9elfCZfYpPtADfYSyj3B1TXr1x_OWWbAN2GDWHjBO7dpwjiFZV6Vv7uRPDaptFhpLH_N4xtW4m55bF9X3Jhre3LcMJyzOKFVSscGH_SsktL788IsA5IWElY_mp_WNmEVQ1TnaIpCUwFCqpX8kQBHaRk1i49shheqYOH1gJEFCAZeeq-1_TiYATrkMP-ZB2aSPkIHqSj7cLkH35RU2SLtre49PdQ", forHTTPHeaderField: "Authorization")
  }
}
