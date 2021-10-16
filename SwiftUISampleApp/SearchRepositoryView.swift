//
//  ContentView.swift
//  SwiftUISampleApp
//
//  Created by 林健司 on 2021/09/23.
//

import SwiftUI

struct SearchRepositoryView: View {

    @StateObject private var viewModel = SearchRepositoryViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.repositories, id: \.asRepository?.id) { repository in
                    if
                        let urlString = repository.asRepository?.url,
                        let url = URL(string: urlString) {
                        NavigationLink(
                            destination: WebView(url: url)
                                .navigationBarTitleDisplayMode(.inline)

                        ) {
                            RepositoryView(repository: repository.asRepository!)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Search Repository")
            .searchable(
                text: $viewModel.searchText,
                placement: .sidebar,
                prompt: "Search Repository"
            )
        }
    }
}

struct SearchRepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRepositoryView()
    }
}
