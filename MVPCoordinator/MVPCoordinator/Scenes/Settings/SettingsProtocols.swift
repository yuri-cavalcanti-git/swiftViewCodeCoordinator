import UIKit

protocol SettingsViewType where Self: UIView {
    var didTapButton: (() -> Void)? { get set }
    func show(titleText: String?)
}

protocol SettingsViewControllerType where Self: UIViewController {
    func show(titleText: String?)
}

protocol SettingsPresenterType {
    func load()
}

protocol SettingsViewControllerDelegate: AnyObject {
    func presentListView()
}
