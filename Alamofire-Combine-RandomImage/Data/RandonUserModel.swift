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
    let name: Name
    let email: String
    let phote: Photo
    
    private enum CodingKeys: String, CodingKey {
        case name
        case email
        case phote = "picture"
    }
    
}

struct Name: Codable {
    let title: String
    let first: String
    let last: String
    
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

