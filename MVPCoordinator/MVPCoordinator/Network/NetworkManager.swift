import Foundation

class NetworkManager: NetworkProtocol {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func request<T: Codable>(service: ServiceProtocol, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = service.url else {
            print("Error with URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = service.httpMethod.rawValue
        request.allHTTPHeaderFields = service.headers
        
        if let body = service.body {
            request.httpBody = body
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Status code: \(response.statusCode)")
            }
            
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let jsonData = try decoder.decode(T.self, from: data)
                print("Received JSON: \(jsonData)")
                completion(.success(jsonData))
            } catch {
                print("Failed to decode JSON: \(error)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
