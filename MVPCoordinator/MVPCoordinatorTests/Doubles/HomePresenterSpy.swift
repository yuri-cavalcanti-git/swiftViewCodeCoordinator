@testable import MVPCoordinator

final class HomePresenterSpy: HomePresenterType {
    private(set) var loadCount = 0
    func load() {
        loadCount += 1
    }
}
