import UIKit

@testable import MVPCoordinator

final class ViewControllerMock: UIViewController {
    weak var lastPresentedController: UIViewController?
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: nil)
    }
    
    override func present(_ viewControllerToPresent: UIViewController,
                          animated flag: Bool,
                          completion: (() -> Void)? = nil) {
        lastPresentedController = viewControllerToPresent
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}
