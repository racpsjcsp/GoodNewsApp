//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Rafael Plinio on 22/06/21.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]

    var numberOfSections: Int {
        return 1
    }

    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }

    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel {
    private let article: Article

    init(_ article: Article) {
        self.article = article
    }

    var title: String {
        return self.article.title
    }

    var description: String {
        return self.article.description
    }
}
