import UIKit

protocol ListViewType where Self: UIView {
    var didTapLanguage: ((String) -> Void)? { get set }
    func show(list: [String])
}

protocol ListViewControllerType where Self: UIViewController {
    func show(list: [String])
}

protocol ListPresenterType {
    func load()
}

protocol ListViewControllerDelegate: AnyObject {
}
