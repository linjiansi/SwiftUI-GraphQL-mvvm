//
//  APIClient.swift
//  SwiftUISampleApp
//
//  Created by 林健司 on 2021/10/03.
//

import Foundation
import Apollo

struct APIClient {

    static func request<T: Request>(
        item: T,
        cachePolicy: CachePolicy = .returnCacheDataElseFetch,
        queue: DispatchQueue = .main,
        completion: @escaping GraphQLResultHandler<T.Query.Data>
    ) {

        let store = ApolloStore(cache: InMemoryNormalizedCache())

        let interceptorProvider = NetworkInterceptorProvider(
            store: store,
            client: .init()
        )

        let networkTransport = RequestChainNetworkTransport(
            interceptorProvider: interceptorProvider,
            endpointURL: item.url!,
            additionalHeaders: item.headers
        )

        let apolloClient = ApolloClient(
            networkTransport: networkTransport,
            store: store
        )

        apolloClient.fetch(
            query: item.query,
            cachePolicy: cachePolicy,
            queue: queue,
            resultHandler: completion
        )
    }
}
