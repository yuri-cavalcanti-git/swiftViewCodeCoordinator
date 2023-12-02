@testable import MVPCoordinator

final class SettingsPresenterSpy: SettingsPresenterType {
    private(set) var loadCount = 0
    func load() {
        loadCount += 1
    }
}
