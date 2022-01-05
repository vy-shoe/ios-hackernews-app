//
//  WebView.swift
//  ios-hackernews-app
//
//  Created by Vaishu Adi on 1/4/22.
//

import Foundation
import WebKit
import SwiftUI //knows about Context and UIViewRepresentable

// Reusable component which is a webview, so in the future, we can tap into this struct
// In order to show the content of a URL, we need to use a WebView which imports WebKit
// Context = UIViewRepresentableContext<WebView>
struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    //what we need to display into it
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
