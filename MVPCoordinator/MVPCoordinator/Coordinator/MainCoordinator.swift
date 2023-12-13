import UIKit

public enum Flows {
    case firstFlow
}

public final class MainCoordinator: Coordinator {
    
    public var navigationController: UINavigationController
    //    public var currentViewController: UIViewController? { navigationController.visibleViewController }
    public var currentViewController: UIViewController? {
        return navigationController.topViewController
    }
    
    private let flow: Flows
    private let network: NetworkProtocol
    private let controllerFactory: CoordinatorFactory
    
    init(navigationController: UINavigationController,
         flow: Flows,
         network: NetworkProtocol) {
        self.navigationController = navigationController
        self.flow = flow
        self.network = network
        self.controllerFactory = CoordinatorFactory(network: network)
    }
    
    public func start() {
        switch flow {
        case .firstFlow:
            let controller = createHomeViewController()
            navigationController.pushViewController(controller, animated: true)
        }
    }
    
    private func createHomeViewController() -> HomeViewController {
        let controller = controllerFactory.buildHome()
        controller.delegate = self
        return controller
    }
}

extension MainCoordinator: HomeViewControllerDelegate {
    func openSettings() {
        let controller = controllerFactory.buildSettings()
        controller.delegate = self
        navigationController.pushViewController(controller, animated: true)
    }
}

extension MainCoordinator: SettingsViewControllerDelegate {
    func presentListView() {
        let controller = controllerFactory.buildList()
        controller.delegate = self
        navigationController.present(controller, animated: true)
    }
}

extension MainCoordinator: ListViewControllerDelegate {
    func updateText(language: String) {
        navigationController.viewControllers
            .compactMap { $0 as? ListUpdateListener }
            .forEach { $0.updateTitle(language: language)}
        navigationController.dismiss(animated: true)
    }
}

/*
1- Remove da stack:
 navigationController.viewControllers.removeAll {
    $0 is NomeDaViewController
 
 2- pra dar um pop para determinada ViewController
 guard let nomeDaViewController = navigationController.viewControllers.first(where: { $0 is NomeDaViewController }) else {
    navigationController.popToRootViewController(animated: true)
    return
 }
 navigationController.popToViewControllwe(nomeDaViewController: navigationController)
*/
