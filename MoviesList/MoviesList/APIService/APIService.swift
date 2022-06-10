import Foundation
import Combine

protocol MoviesClientProtocol {
    func fetchMovies(page: Int) -> AnyPublisher<MoviesResponse, Error>
}

class APIService: MoviesClientProtocol{

    func fetchMovies(page: Int) -> AnyPublisher<MoviesResponse, Error> {
        
        var components = URLComponents(string: "https://api.themoviedb.org/3/discover/movie")!
        
        components.queryItems = [
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "api_key", value: "c9856d0cb57c3f14bf75bdc6c063b8f3"),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "include_adult", value: "false"),
            URLQueryItem(name: "with_watch_monetization_types", value: "flatrate"),
            URLQueryItem(name: "sort_by", value: "popularity.desc"),
            URLQueryItem(name: "include_video", value: "false")
        ]
        
        
        let request = URLRequest(url: components.url!, timeoutInterval: 10)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: MoviesResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
