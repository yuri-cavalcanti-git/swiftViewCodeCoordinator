import UIKit

@testable import MVPCoordinator

final class UINavigationControllerMock: UINavigationController {
    
    private(set) var hasCalledDismiss = false
    private(set) var dismissCount = 0
    private(set) var hasCalledPopViewController = false
    private(set) var popViewControllerCount = 0
    private(set) var hasCalledPopToViewController = false
    private(set) var popToViewControllerCount = 0
    private(set) var hasCalledPopToRootViewController = false
    private(set) var popToRootViewControllerCount = 0
    private(set) var setViewControllersCount = 0
    
    private(set) var currentPushedViewController: UIViewController?
    private(set) var currentPresentedViewController: UIViewController?
    private(set) var setViewControllers: [UIViewController]?
    
    private(set) var visibleViewControllerCount = 0
    public var visibleViewControllerValue: UIViewController?
    
    override var presentedViewController: UIViewController? {
        return currentPresentedViewController
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        hasCalledDismiss = true
        dismissCount += 1
        completion?()
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        setViewControllersCount += 1
        setViewControllers = viewControllers
        super.setViewControllers(viewControllers, animated: false)
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        hasCalledPopViewController = true
        popViewControllerCount += 1
        return super.popViewController(animated: false)
    }
    
    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        hasCalledPopToViewController = true
        popToViewControllerCount += 1
        return super.popToViewController(viewController, animated: false)
    }
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        hasCalledPopToRootViewController = true
        popToRootViewControllerCount += 1
        return super.popToRootViewController(animated: false)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        currentPushedViewController = viewController
        super.pushViewController(viewController, animated: false)
    }
    
    override func present(_ viewControllerToPresent: UIViewController,
                          animated flag: Bool,
                          completion: (() -> Void)? = nil) {
        defer {
            completion?()
        }
        
        currentPresentedViewController = viewControllerToPresent
        super.present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    override var visibleViewController: UIViewController? {
        visibleViewControllerCount += 1
        return visibleViewControllerValue ?? super.visibleViewController
    }
}
