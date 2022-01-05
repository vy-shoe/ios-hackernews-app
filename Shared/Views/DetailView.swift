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

