import UIKit

struct CoordinatorFactory {
    func buildHome() -> HomeViewController {
        let contentView = HomeView()
        let presenter = HomePresenter(text: "Hello")
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
}
