//
//  ContentView.swift
//  Shared
//
//  Created by Vaishu Adi on 1/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            //for every post in post array, make a Test item using it's title
            List(posts) { post in
                Text(post.title)
            }
        }.navigationTitle("hackernews")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//allows list to recognize the order by id
struct Post: Identifiable {
    let id: String
    let title: String
}

let posts = [
    Post(id: "1", title: "Hello"),
    Post(id: "1", title: "Bonjour"),
    Post(id: "1", title: "Hola")
]
