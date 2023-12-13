@testable import MVPCoordinator

final class SettingsViewControllerDelegateSpy: SettingsViewControllerDelegate {
    private(set) var presentListViewCount = 0
    func presentListView() {
        presentListViewCount += 1
    }
}
