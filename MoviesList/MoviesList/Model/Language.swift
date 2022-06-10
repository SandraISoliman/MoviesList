import Foundation

struct Language: Decodable, Equatable {
    let id: Int?
    let name: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "iso_639_1"
        case name = "name"
    }
    
    static func == (lhs: Language, rhs: Language) -> Bool {
        if lhs.id == rhs.id && lhs.name == rhs.name{
            return true
        }
        return false
    }
}
