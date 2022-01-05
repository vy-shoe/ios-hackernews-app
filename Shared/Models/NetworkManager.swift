//
//  NetworkManager.swift
//  ios-hackernews-app
//
//  Created by Vaishu Adi on 1/4/22.
//

import Foundation

//ObservableObject protocol broadcasts its properties to any interested parties

class NetworkManager: ObservableObject {
    @Published var posts = [Post]() //if you "subscribe to the property called post, you'll hear from it everytime it changes
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil { //if there is no error
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            
                            //Since posts is a property other objects are listening to, so the update must happen on the main thread and must not happen in the background or else it wont update in a timely fashion
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                        } catch {
                            print(error)
                        }
                    }
                    
                }
            }
            task.resume() //starts networking task and
        }
        // now we can address results and get the data from the NetworkManager into the ContentView- use observer design pattern
    }
}
