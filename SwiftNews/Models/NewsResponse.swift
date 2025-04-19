//
//  NewsResponse.swift
//  SwiftNews
//
//  Created by Bence Családi on 2025. 04. 19..
//

import Foundation

// Model for the response from the API
struct NewsResponse: Codable {
    let articles: [Article]  // List of articles
}
