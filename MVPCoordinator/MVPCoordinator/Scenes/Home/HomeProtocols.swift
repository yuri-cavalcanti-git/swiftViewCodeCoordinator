import UIKit
protocol HomeViewType where Self: UIView {
    var didTapButton: (() -> Void)? { get set }
    func show(state: HomeViewState)
}

protocol HomeViewControllerType where Self: UIViewController {
    func show(state: HomeViewState)
}

protocol HomePresenterType {
    func load()
}

protocol HomeViewControllerDelegate: AnyObject {
    func openSettings()
}
