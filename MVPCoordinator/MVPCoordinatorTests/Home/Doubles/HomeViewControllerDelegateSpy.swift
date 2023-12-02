@testable import MVPCoordinator

final class HomeViewControllerDelegateSpy: HomeViewControllerDelegate {
    private(set) var openSettingsCount = 0
    func openSettings() {
        openSettingsCount += 1
    }
}
