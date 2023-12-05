import Foundation

struct JokesResponse: Codable {
    let type, setup, punchline: String
    let id: Int
}
