import UIKit

public enum Flows {
    case firstFlow
}

public final class MainCoordinator: Coordinator {
    
    public var navigationController: UINavigationController
    public var currentViewController: UIViewController? { navigationController.visibleViewController }
    
    private let flow: Flows
    
    public init(navigationController: UINavigationController,
                flow: Flows) {
        self.navigationController = navigationController
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
        let contentView = HomeView()
        let presenter = HomePresenter(text: "Hello")
        let controller = HomeViewController(contentView: contentView,
                                            presenter: presenter)
        presenter.controller = controller
        controller.delegate = self
        return controller
    }
}

extension MainCoordinator: HomeViewControllerDelegate {
}
