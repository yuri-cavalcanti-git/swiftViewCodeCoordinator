import Foundation

struct GetJokesService: ServiceProtocol {
    var path: String {
        return "/random_joke"
    }
    
    var httpMethod: HttpMethod {
        return .get
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var body: Data? {
        return nil
    }
}
