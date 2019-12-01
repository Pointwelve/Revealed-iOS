//
//  ApolloNetwork+Combine.swift
//  Revealed
//
//  Created by Hong on 30/11/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Foundation
import Apollo
import Combine
// WIP
extension Combine.Publishers {
    struct QueryPublisher<Client: ApolloClient, Query: GraphQLQuery>: Publisher {
        public typealias Output = Query.Data
        public typealias Failure = Never
        
        private let client: ApolloClient
        private let query: Query
        init(client: ApolloClient,
             query: Query) {
            self.client = client
            self.query = query
        }
        
        public func receive<S: Subscriber>(subscriber: S) where S.Failure == Failure, S.Input == Output {
            let subscription = Subscription(subscriber: subscriber,
                                            client: client,
                                            query: query)
            
            subscriber.receive(subscription: subscription)
        }
    }
}

private extension Combine.Publishers.QueryPublisher {
    private final class Subscription<S: Subscriber, Client: ApolloClient, Query: GraphQLQuery>: Combine.Subscription where S.Input == Query.Data {
        private var subscriber: S?
        private let query: Query
        weak private var client: ApolloClient?
        
        init(subscriber: S,
             client: ApolloClient,
             query: Query) {
            self.client = client
            self.query = query
            
        }
        
        func request(_ demand: Subscribers.Demand) {
        }
        
        func cancel() {
            subscriber = nil
        }
    }
}

extension ApolloClient {
    func fetchPublisher<Query>(query: Query,
                               cachePolicy: Apollo.CachePolicy = .returnCacheDataElseFetch,
                               context: UnsafeMutableRawPointer? = nil,
                               queue: DispatchQueue = DispatchQueue.main) -> AnyPublisher<Query.Data, Error>  where Query : Apollo.GraphQLQuery {
        let subject = PassthroughSubject<Query.Data, Error>()

        fetch(query: query,
              cachePolicy: cachePolicy,
              context: context,
              queue: queue) { (result) in
                switch result {
                case let .success(result):

                    guard (result.errors ?? []).isEmpty else {
                        if let error = result.errors?.first {
                            subject.send(completion: .failure(error))
                        }
                        return
                    }
                    if let data = result.data {
                        subject.send(data)
                    }
                case let .failure(error):
                    subject.send(completion: .failure(error))
                }
        }

        return subject.eraseToAnyPublisher()
    }

    func mutatePublisher<Mutation>(mutation: Mutation,
                                   cachePolicy: Apollo.CachePolicy = .returnCacheDataElseFetch,
                                   context: UnsafeMutableRawPointer? = nil,
                                   queue: DispatchQueue = DispatchQueue.main) -> AnyPublisher<Mutation.Data, Error>  where Mutation : Apollo.GraphQLMutation {
        let subject = PassthroughSubject<Mutation.Data, Error>()
        
        perform(mutation: mutation,
                context: context,
                queue: queue) { result in
                    switch result {
                    case let .success(result):

                        guard (result.errors ?? []).isEmpty else {
                            if let error = result.errors?.first {
                                subject.send(completion: .failure(error))
                            }
                            return
                        }
                        if let data = result.data {
                            subject.send(data)
                        }
                    case let .failure(error):
                        subject.send(completion: .failure(error))
                    }
        }
        return subject.eraseToAnyPublisher()
    }
}

