import Foundation
import SwiftUI

struct Movie: Decodable, Equatable {
    let id: Int
    let posterPath: String?
    let adult: Bool?
    let overview: String?
    let releaseDate: String?
    let genreIds: [Int]?
    let originalTitle: String?
    let originalLanguage: String?
    let title: String?
    let backdropPath: String?
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let voteAverage: Double?
    let tagline: String?
    let spokenLanguages: [Language]?
    let genres: [Genre]?
    let originCountry: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case posterPath = "poster_path"
        case adult = "adult"
        case overview = "overview"
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title = "title"
        case backdropPath = "backdrop_path"
        case popularity = "popularity"
        case voteCount = "vote_count"
        case video = "video"
        case voteAverage = "vote_average"
        case tagline = "tagline"
        case spokenLanguages = "spoken_languages"
        case genres = "genres"
        case originCountry = "origin_country"
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        if lhs.id == rhs.id && lhs.posterPath == rhs.posterPath && lhs.adult == rhs.adult && lhs.overview == rhs.overview && lhs.releaseDate == rhs.releaseDate && lhs.genreIds == rhs.genreIds && lhs.originalTitle == rhs.originalTitle && lhs.originalLanguage == rhs.originalLanguage && lhs.title == rhs.title && lhs.backdropPath == rhs.backdropPath && lhs.popularity == rhs.popularity && lhs.voteCount == rhs.voteCount && lhs.video == rhs.video && lhs.voteAverage == rhs.voteAverage && lhs.spokenLanguages == rhs.spokenLanguages && lhs.genres == rhs.genres && lhs.originCountry == rhs.originCountry{
            return true
        }
        return false
    }
}







