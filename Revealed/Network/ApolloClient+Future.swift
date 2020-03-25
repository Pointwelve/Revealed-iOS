//
//  ApolloNetwork+Combine.swift
//  Revealed
//
//  Created by Hong on 30/11/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Apollo
import Combine
import Foundation

extension ApolloClient {
  func fetchFuture<Query>(query: Query,
                          cachePolicy: Apollo.CachePolicy = .returnCacheDataElseFetch,
                          context: UnsafeMutableRawPointer? = nil,
                          queue: DispatchQueue = DispatchQueue(label: "com.pointwelve.revealed.fetch"))
    -> Future<Query.Data, Error> where Query: Apollo.GraphQLQuery {
    return Future<Query.Data, Error> { [weak self] promise in
      self?.fetch(query: query,
                  cachePolicy: cachePolicy,
                  context: context,
                  queue: queue) { result in
        switch result {
        case let .success(result):
          guard (result.errors ?? []).isEmpty else {
            if let error = result.errors?.first {
              promise(.failure(error))
            }
            return
          }

          guard let data = result.data else {
            promise(.failure(ApolloError.empty))
            return
          }
          promise(.success(data))
        case let .failure(error):
          promise(.failure(error))
        }
      }
    }
  }

  func mutateFuture<Mutation>(mutation: Mutation,
                              cachePolicy: Apollo.CachePolicy = .returnCacheDataElseFetch,
                              context: UnsafeMutableRawPointer? = nil,
                              queue: DispatchQueue =  DispatchQueue(label: "com.pointwelve.revealed.mutate"))
    -> Future<Mutation.Data, Error> where Mutation: Apollo.GraphQLMutation {
    return Future<Mutation.Data, Error> { [weak self] promise in
      self?.perform(mutation: mutation,
                    context: context,
                    queue: queue) { result in
        switch result {
        case let .success(result):
          guard (result.errors ?? []).isEmpty else {
            if let error = result.errors?.first {
              promise(.failure(error))
            }
            return
          }

          guard let data = result.data else {
            promise(.failure(ApolloError.empty))
            return
          }
          promise(.success(data))
        case let .failure(error):
          promise(.failure(error))
        }
      }
    }
  }
}
