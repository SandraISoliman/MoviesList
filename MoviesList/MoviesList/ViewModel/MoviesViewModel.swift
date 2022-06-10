import Foundation
import Combine

class MoviesViewModel: ObservableObject {

    @Published var movies: [Movie] = []
    @Published var isRequestFailed = false
  
    private var cancellable: AnyCancellable?
    private var apiService: MoviesClientProtocol
    
    var cuurentPage = 1
    var totalNumberOfPages : Int = 1
    
    init(apiService: MoviesClientProtocol){
        self.apiService = apiService
    }
    
    func fetchMovies() {
        cancellable = apiService.fetchMovies(page: cuurentPage)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(_):
                    self.isRequestFailed = true
                case .finished:
                    self.isRequestFailed = false
                }
            } receiveValue: { moviesResponse in
                                
                if let movies = moviesResponse.results{
                    self.movies.append(contentsOf: movies)
                    self.totalNumberOfPages = moviesResponse.totalPages ?? 1
                    self.cuurentPage += 1
                }
            }
    }
    
}
