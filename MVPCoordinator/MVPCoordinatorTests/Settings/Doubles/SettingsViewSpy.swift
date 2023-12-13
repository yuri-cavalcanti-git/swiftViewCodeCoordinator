import UIKit

@testable import MVPCoordinator

final class SettingsViewSpy: UIView, SettingsViewType {
    var didTapButton: (() -> Void)?
    
    private(set) var showParam = [String?]()
    func show(titleText: String?) {
        showParam.append(titleText)
    }
}
