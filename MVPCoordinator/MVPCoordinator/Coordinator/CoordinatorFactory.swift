import UIKit

struct CoordinatorFactory {
    private let repository: JokeRepository
    
    init(network: NetworkProtocol) {
        self.repository = JokeRepository(http: network)
    }
    
    func buildHome() -> HomeViewController {
        let contentView = HomeView()
        let presenter = HomePresenter(repository: repository)
        let controller = HomeViewController(contentView: contentView,
                                            presenter: presenter)
        presenter.controller = controller
        return controller
    }
    
    func buildSettings() -> SettingsViewController {
        let contentView = SettingsView()
        let presenter = SettingsPresenter()
        let controller = SettingsViewController(contentView: contentView,
                                                presenter: presenter)
        presenter.controller = controller
        return controller
    }
    
    func buildList() -> ListViewController {
        let contentView = ListView()
        let presenter = ListPresenter()
        let controller = ListViewController(contentView: contentView,
                                                presenter: presenter)
        presenter.controller = controller
        return controller
    }
}
