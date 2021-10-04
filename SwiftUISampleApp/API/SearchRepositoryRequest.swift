//
//  SearchRepositoryRequest.swift
//  SwiftUISampleApp
//
//  Created by 林健司 on 2021/10/03.
//

import Foundation
import Apollo

struct SearchRepositoryRequst: Request {

    typealias Query = SearchRepositoryQuery

    var query: SearchRepositoryQuery

    var url: URL? {
        let urlString = "https://api.github.com/graphql"
        return URL(string: urlString)
    }

    var headers: [String : String] {
        ["Authorization": "Bearer GITHUB_TOKEN"]
    }
}
