//
//  NetWorkInterceptorProvider.swift
//  SwiftUISampleApp
//
//  Created by 林健司 on 2021/10/17.
//

import Apollo

struct NetworkInterceptorProvider: InterceptorProvider {

    private let store: ApolloStore
    private let client: URLSessionClient

    init(
        store: ApolloStore,
        client: URLSessionClient
    ) {
        self.store = store
        self.client = client
    }

    func interceptors<Operation: GraphQLOperation>(
        for operation: Operation
    ) -> [ApolloInterceptor] {
        [
            MaxRetryInterceptor(),
            CacheReadInterceptor(store: self.store),
            NetworkFetchInterceptor(client: self.client),
            ResponseCodeInterceptor(),
            JSONResponseParsingInterceptor(cacheKeyForObject: self.store.cacheKeyForObject),
            AutomaticPersistedQueryInterceptor(),
            CacheWriteInterceptor(store: self.store)
        ]
    }
}
