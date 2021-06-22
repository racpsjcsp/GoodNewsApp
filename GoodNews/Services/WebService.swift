//
//  WebService.swift
//  GoodNews
//
//  Created by Rafael Plinio on 22/06/21.
//

import Foundation

class WebService {

    func getArticles(url: URL, completionHandler: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completionHandler(nil)
            } else if let data = data {

                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)

                if let articleList = articleList {
                    completionHandler(articleList.articles)
                }
                print(articleList?.articles)
            }
        }.resume()
    }
}
