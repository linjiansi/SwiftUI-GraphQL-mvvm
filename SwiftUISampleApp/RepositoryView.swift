//
//  RepositoryView.swift
//  SwiftUISampleApp
//
//  Created by 林健司 on 2021/10/16.
//

import SwiftUI

struct RepositoryView: View {

    let repository: SearchRepositoryRequst.Query.Data.Search.Node.AsRepository

    var body: some View {

        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "doc")
                Text(repository.name)
                    .bold()
            }

            Text("\(repository.description ?? "")")

            HStack {
                Image(systemName: "star")
                Text("\(repository.stargazerCount)")
                Text(repository.primaryLanguage?.name ?? "")
            }
        }
    }
}


