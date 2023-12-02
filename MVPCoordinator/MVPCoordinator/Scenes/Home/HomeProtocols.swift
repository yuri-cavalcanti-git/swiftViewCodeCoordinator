import UIKit
protocol HomeViewType where Self: UIView {
    func show(text: String)
}

protocol HomeViewControllerType where Self: UIViewController {
    func show(text: String)
}

protocol HomePresenterType {
    func load()
}

protocol HomeViewControllerDelegate: AnyObject {
    func openSettings()
}
