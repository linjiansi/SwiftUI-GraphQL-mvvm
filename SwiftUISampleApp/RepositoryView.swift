//
//  RepositoryView.swift
//  SwiftUISampleApp
//
//  Created by 林健司 on 2021/10/16.
//

import SwiftUI

struct RepositoryView: View {

    let repository: SearchRepositoryRequst.Query.Data.Search.Node.AsRepository

    private var colorCode: String {
        var colorCode = repository.primaryLanguage?.color ?? ""
        guard
            let range = colorCode.range(of: "#")
        else {
            return ""
        }
        colorCode.removeSubrange(range)
        return colorCode
    }

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
                Circle()
                    .fill(Color.init(hex: colorCode))
                    .frame(width: 10, height: 10)
                Text(repository.primaryLanguage?.name ?? "")
            }
        }
    }
}


