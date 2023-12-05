import UIKit

final class HomePresenter {
    weak var controller: HomeViewControllerType?
    private let repository: JokeRepositoryType
    
    
    init(repository: JokeRepositoryType) {
        self.repository = repository
    }
}

extension HomePresenter: HomePresenterType {
    func load() {
        repository.getJoke { [weak self] result in
            switch result {
            case .success(let response):
                print(response)
                // Todo
            case .failure(let error):
                print(error.localizedDescription)
                // Todo
            }
        }
    }
}
