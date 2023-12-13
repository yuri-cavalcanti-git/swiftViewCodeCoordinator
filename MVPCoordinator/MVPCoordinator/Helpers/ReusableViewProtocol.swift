import UIKit

protocol ReusableViewProtocol: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReusableViewProtocol where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableViewProtocol {}
extension UITableViewCell: ReusableViewProtocol {}
extension UITableViewHeaderFooterView: ReusableViewProtocol {}
