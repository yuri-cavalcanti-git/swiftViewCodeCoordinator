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

    private let controllerFactory: CoordinatorFactory
    
    private let flow: Flows
    
    public init(navigationController: UINavigationController,
                flow: Flows) {
        self.navigationController = navigationController
        self.controllerFactory = CoordinatorFactory()
        self.flow = flow
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
    
}
