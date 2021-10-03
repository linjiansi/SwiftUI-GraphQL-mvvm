//
//  SearchRepositoryViewModel.swift
//  SwiftUISampleApp
//
//  Created by 林健司 on 2021/10/03.
//

import Foundation
import Combine
import Apollo

class SearchRepositoryViewModel: ObservableObject {

    @Published public var searchText = "" {
        willSet {
            DispatchQueue.main.async {
                self.searchSubject.send(newValue)
            }
        }
        didSet {
            guard !searchText.isEmpty else {
                repositories.removeAll()
                return
            }
        }
    }

    @Published public var repositories: [SearchRepositoryRequst.Query.Data.Search.Node] = []

    private let searchSubject = PassthroughSubject<String, Never>()
    private var searchCencellable: AnyCancellable? {
        didSet {
            oldValue?.cancel()
        }
    }

    init() {
        searchCencellable = searchSubject.eraseToAnyPublisher()
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .filter{ !$0.isEmpty }
            .sink(receiveValue: { [weak self] searchText in
                self?.fetchSearchRepository(
                    request: SearchRepositoryRequst(
                        query: SearchRepositoryQuery(
                            type: .repository,
                            query: searchText
                        )
                    )
                ) { [weak self] result in
                    switch result {
                        case .success(let result):
                            guard
                                let repositories = result.data?.search.nodes as? [SearchRepositoryRequst.Query.Data.Search.Node]
                            else {
                                return
                            }
                            self?.repositories = repositories
                        case .failure:
                            print("Occur GraphQL ERROR")
                    }
                }
            })

    }

    private func fetchSearchRepository<T: Request>(
        request: T,
        completion: @escaping GraphQLResultHandler<T.Query.Data>) {
        APIClient.request(item: request, completion: completion)
    }
}
