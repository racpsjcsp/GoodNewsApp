//
//  GoodNewsListTableViewController.swift
//  GoodNews
//
//  Created by Rafael Plinio on 22/06/21.
//

import Foundation
import UIKit

class GoodNewsListTableViewController: UITableViewController {

    var country = ""
    private var articleListViewModel: ArticleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true

        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=b4019faf61bc4699b2eb060207007e2f")!
        print(url)
        WebService().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleListViewModel = ArticleListViewModel(articles: articles)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel.numberOfRowsInSection(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }

        let articleViewModel = self.articleListViewModel.articleAtIndex(indexPath.row)

        cell.titleLabel.text = articleViewModel.title
        cell.descriptionLabel.text = articleViewModel.description

        return cell
    }
}
