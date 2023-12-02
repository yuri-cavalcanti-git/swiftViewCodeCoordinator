import UIKit

@testable import MVPCoordinator

final class SettingsViewSpy: UIView, SettingsViewType {
    var didTapButton: (() -> Void)?
    
    private(set) var showCount = 0
    func show() {
        showCount += 1
    }
}
