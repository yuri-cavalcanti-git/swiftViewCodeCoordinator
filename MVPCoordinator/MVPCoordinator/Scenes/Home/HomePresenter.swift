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
        controller?.show(state: .loading)
        repository.getJoke { [weak self] result in
            switch result {
            case .success(let response):
                self?.controller?.show(state: .ready(viewmodel: HomeReadyViewModel(setup: response.setup,
                                                                                   punchline: response.punchline)))
            case .failure(let error):
                self?.controller?.show(state: .error(error: error.localizedDescription))
            }
        }
    }
}
