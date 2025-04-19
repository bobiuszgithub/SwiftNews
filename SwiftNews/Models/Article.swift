//
//  Article.swift
//  SwiftNews
//
//  Created by Bence Családi on 2025. 04. 19..
//

import Foundation

// Model to represent an article
struct Article: Codable, Identifiable {
    var id: String { url } // Identifiable by the URL, assuming it's unique for each article
    
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
}
