import UIKit

public protocol Coordinator {
    var currentViewController: UIViewController? { get }
    var navigationController: UINavigationController { get }
    func start()
}
