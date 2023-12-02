import UIKit

protocol SettingsViewType where Self: UIView {
    var didTapButton: (() -> Void)? { get set }
    func show()
}

protocol SettingsViewControllerType where Self: UIViewController {
    func show()
}

protocol SettingsPresenterType {
    func load()
}

protocol SettingsViewControllerDelegate: AnyObject {
}
