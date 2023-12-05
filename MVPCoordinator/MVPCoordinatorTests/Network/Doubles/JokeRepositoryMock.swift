@testable import MVPCoordinator

final class JokeRepositoryMock: JokeRepositoryType {
    private(set) var getJokeCount = 0
    var getJokeResult: Result<JokesResponse, Error> = .success(.stub())
    
    func getJoke(completion: @escaping (Result<MVPCoordinator.JokesResponse, Error>) -> Void) {
        getJokeCount += 1
        completion(getJokeResult)
    }
}
