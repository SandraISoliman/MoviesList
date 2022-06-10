import Foundation

struct Genre: Decodable, Equatable {
    let id: Int?
    let name: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    static func == (lhs: Genre, rhs: Genre) -> Bool {
        if lhs.id == rhs.id && lhs.name == rhs.name{
            return true
        }
        return false
    }
}
