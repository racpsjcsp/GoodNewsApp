//
//  Article.swift
//  GoodNews
//
//  Created by Rafael Plinio on 22/06/21.
//

import Foundation

struct ArticleList: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String
}
