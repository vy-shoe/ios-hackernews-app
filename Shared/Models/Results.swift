//
//  Results.swift
//  ios-hackernews-app
//
//  Created by Vaishu Adi on 1/4/22.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

//Identifiable protocal allows List to recognize the order by id
struct Post: Decodable, Identifiable {
    var id: String { //identify protocol needs "id", so since we already have one, we can use computed properties
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String? //url may be null in API results
}
