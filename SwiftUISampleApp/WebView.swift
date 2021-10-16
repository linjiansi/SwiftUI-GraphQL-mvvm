//
//  WebView.swift
//  SwiftUISampleApp
//
//  Created by 林健司 on 2021/10/14.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {

    private let webView = WKWebView()
    let url: URL

    func makeUIView(
        context: UIViewRepresentableContext<WebView>
    ) -> WKWebView {
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }

    func updateUIView(
        _ uiView: WKWebView,
        context: Context
    ) {}

}
