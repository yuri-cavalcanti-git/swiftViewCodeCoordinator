protocol JokeRepositoryType {
    func getJoke(completion: @escaping (Result<JokesResponse, ApiError>) -> Void)
}
