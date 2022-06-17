import SwiftUI



struct RandomUserModel: Codable, CustomStringConvertible {
    let results: [Result]
    let info: Info
    
    var description: String {
        return "results: \(results.count), info: \(info.seed)"
    }
    private enum CodingKeys: String, CodingKey {
        case results
        case info
    }
}

struct Result: Codable, Identifiable {
    var id = UUID()
    var name: Name
    var email: String
    var phote: Photo
    
    private enum CodingKeys: String, CodingKey {
        case name
        case email
        case phote = "picture"
    }
    
    static func getDummy() -> Self {
        return Result(name: Name.getDummy(), email: "", phote: Photo.getDummy())
    }
    
    var profileImageURL: URL {
        get {
            URL(string: phote.large)!
        }
    }
    
    var profileName: String {
        get {
            "\(name.title) \(name.last) \(name.first)"
        }
    }
    
}

struct Name: Codable {
    let title: String
    let first: String
    let last: String
    
    static func getDummy() -> Self {
        return Name(title: "운동선수", first: "종희", last: "김")
    }
    
}

struct Photo: Codable {
    let large: String
    let medium: String
    let thumbnail: String
    
    private enum CodingKeys: String, CodingKey {
        case large
        case medium
        case thumbnail
    }
    
    static func getDummy() -> Self {
        return Photo(large: "https://randomuser.me/api/portraits/women/67.jpg", medium: "https://randomuser.me/api/portraits/women/67.jpg", thumbnail: "https://randomuser.me/api/portraits/women/67.jpg")
    }
}

struct Info: Codable {
    let seed: String
    let resultCout: Int
    let page: Int
    let version: String
    
    private enum CodingKeys: String, CodingKey {
        case seed
        case resultCout = "results"
        case page
        case version
    }
}

