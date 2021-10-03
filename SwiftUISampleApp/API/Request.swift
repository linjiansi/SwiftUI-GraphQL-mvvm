//
//  Request.swift
//  SwiftUISampleApp
//
//  Created by 林健司 on 2021/10/03.
//

import Foundation
import Apollo

public protocol Request {

    associatedtype Query: GraphQLQuery

    var query: Query { get }
    var url: URL? { get }
    var headers: [String: String] { get }
}

extension Request {
    var headers: [String: String] {
        return [:]
    }
}
