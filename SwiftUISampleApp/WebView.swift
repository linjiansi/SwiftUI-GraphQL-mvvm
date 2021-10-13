//
//  WebView.swift
//  SwiftUISampleApp
//
//  Created by 林健司 on 2021/10/14.
//

import SafariServices
import SwiftUI

struct WebView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(
        context: UIViewControllerRepresentableContext<WebView>
    ) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(
        _ uiViewController: SFSafariViewController,
        context: Context
    ) {}

}
