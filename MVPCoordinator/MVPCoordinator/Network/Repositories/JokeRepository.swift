import Foundation

final class JokeRepository {
    private let http: NetworkProtocol
    init(http: NetworkProtocol) {
        self.http  = http
    }
}

extension JokeRepository: JokeRepositoryType {
    func getJoke(completion: @escaping (Result<JokesResponse, Error>) -> Void) {
        let getJokesService = GetJokesService()
        http.request(service: getJokesService) { (result: Result<JokesResponse, Error>) in
            switch result {
            case .success(let jokesResponse):
                DispatchQueue.main.async {
                    completion(.success(jokesResponse))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
