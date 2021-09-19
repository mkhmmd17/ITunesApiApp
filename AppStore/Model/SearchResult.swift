//
//  SearchResult.swift
//  AppStore
//
//  Created by muslim on 19.09.2021.
//

import Foundation



struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float
}
