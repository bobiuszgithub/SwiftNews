import Foundation

// News Service responsible for fetching news data
class NewsService {
    private let apiKey = Hidden.newsAPIKey
    private let baseURL = "https://newsapi.org/v2/top-headlines?country=us"

    // Fetch the top headlines
    func fetchTopHeadlines(completion: @escaping (Result<[Article], Error>) -> Void) {
        // Construct the full URL
        guard let url = URL(string: "\(baseURL)&apiKey=\(apiKey)") else {
            return completion(.failure(NSError(domain: "Invalid URL", code: -1)))
        }

        // Start the URL session to fetch data
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                return completion(.failure(error))
            }

            guard let data = data else {
                return completion(.failure(NSError(domain: "No data", code: -1)))
            }

            do {
                // Decode the JSON response into NewsResponse
                let decoder = JSONDecoder()
                let response = try decoder.decode(NewsResponse.self, from: data)
                completion(.success(response.articles))  // Return articles
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()  // Start the request
    }
}
