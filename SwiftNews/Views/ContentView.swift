//
//  ContentView.swift
//  SwiftNews
//
//  Created by Bence Családi on 2025. 04. 19..
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NewsViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewModel.articles) { article in
                        VStack(alignment: .leading) {
                            Text(article.title)
                                .font(.headline)
                            Text(article.description ?? "No description")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Top Headlines")
            .onAppear {
                viewModel.fetchTopHeadlines()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
