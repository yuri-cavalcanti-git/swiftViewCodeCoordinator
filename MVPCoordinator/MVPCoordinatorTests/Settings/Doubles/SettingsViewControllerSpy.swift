import UIKit

@testable import MVPCoordinator

final class SettingsViewControllerSpy: UIViewController, SettingsViewControllerType {
    private(set) var showCount = 0
    func show() {
        showCount += 1
    }
}
