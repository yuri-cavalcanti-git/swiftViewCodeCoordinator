protocol JokeRepositoryType {
    func getJoke(completion: @escaping (Result<JokesResponse, Error>) -> Void)
}
