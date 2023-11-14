import UIKit

@testable import MVPCoordinator

final class HomeViewSpy: UIView, HomeViewType {
    private(set) var showParam = [String]()
    func show(text: String) {
        showParam.append(text)
    }
}
