import UIKit

@testable import MVPCoordinator

final class SettingsViewControllerSpy: UIViewController, SettingsViewControllerType {
    private(set) var showParam = [String?]()
    func show(titleText: String?) {
        showParam.append(titleText)
    }
}
