import Foundation

protocol NetworkProtocol: AnyObject {
    func request<T: Codable>(service: ServiceProtocol, completion: @escaping (Result<T, ApiError>) -> Void)
    func request (service: ServiceProtocol, completion: @escaping (Result<Data, ApiError>) -> Void)
}

protocol ServiceProtocol {
    var path: String { get }
    var httpMethod: HttpMethod { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
    var url: URL? { get }
}

extension ServiceProtocol {
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }

    var defaultHeaders: [String: String] {
            var headers: [String: String] = [:]
            if let token = UserDefaults.standard.string(forKey: "authenticationAPI") {
                headers["Authorization"] = "Bearer \(token)"
            }
            return headers
    }
}
