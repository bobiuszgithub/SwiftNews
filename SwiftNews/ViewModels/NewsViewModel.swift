//
//  NewsViewModel.swift
//  SwiftNews
//
//  Created by Bence Családi on 2025. 04. 19..
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var errorMessage: String?

    private let newsService = NewsService()

    func fetchTopHeadlines() {
        newsService.fetchTopHeadlines { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedArticles):
                    self.articles = fetchedArticles
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
