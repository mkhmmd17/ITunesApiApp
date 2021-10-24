//
//  Reviews.swift
//  AppStore
//
//  Created by muslim on 18.10.2021.
//

import Foundation

struct Reviews: Decodable {
    let feed: ReviewFeed
}

struct ReviewFeed: Decodable {
    let entry: [Entry]
}

struct Entry: Decodable {
    let title: Label
    let content: Label
}

struct Label: Decodable {
    let label: String
}
