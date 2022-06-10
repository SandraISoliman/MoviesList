import Foundation

struct MoviesResponse: Decodable, Equatable {

    let page: Int?
    let totalResults: Int?
    let totalPages: Int?
    let results: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results = "results"
    }
    
    static func == (lhs: MoviesResponse, rhs: MoviesResponse) -> Bool {
        if lhs.page == rhs.page && lhs.totalResults == rhs.totalResults && lhs.totalPages == rhs.totalPages && lhs.results == rhs.results{
            return true
        }
        return false
    }
}

