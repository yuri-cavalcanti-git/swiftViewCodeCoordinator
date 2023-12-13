import UIKit

final class SettingsPresenter {
    weak var controller: SettingsViewControllerType?
}

extension SettingsPresenter: SettingsPresenterType {
    func load() {
        controller?.show(titleText: nil)
    }
}
