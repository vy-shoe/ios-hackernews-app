//
//  DetailView.swift
//  ios-hackernews-app
//
//  Created by Vaishu Adi on 1/4/22.
//

import SwiftUI
import WebKit


/*
 1. when detailview loads up, it gets passed in the urlstring
 2. which is used to create a web view from a ui kit component
 3. once updates, it loads
 */
struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        //use the url that is passed into DetailView
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}

//in order to show the content of a URL, we need to use a WebView which imports WebKit
// Context = UIViewRepresentableContext<WebView>
struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WebView.UIViewType {
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
