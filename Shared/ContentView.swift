//
//  ContentView.swift
//  Shared
//
//  Created by Vaishu Adi on 1/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager() //subscribing to updates in networkManager networkManager
    
    /* 1. View Loads up with a nav view and nav title
       2. As soon as it appears, we trigger fetch data method in networkManager
            a. in NM, we decode if there are errors, we catch and print
            b. if not, we save results into posts array
            c. since post property is a Published variable, the networkManager is subscribed and will update UI
     */
    var body: some View {
        NavigationView {
            //for every post in post array, make a Test item using it's title
            List(networkManager.posts) { post in
                HStack {
                    Text(String(post.points))
                    Text(post.title)
                }
            }// whenever post changes, List issues a rebuild of what's inside
            .navigationTitle("hackernews")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "1", title: "Bonjour"),
//    Post(id: "1", title: "Hola")
//]
