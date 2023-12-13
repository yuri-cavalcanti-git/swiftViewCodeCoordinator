@testable import MVPCoordinator

final class ListPresenterSpy: ListPresenterType {
    private(set) var loadCount = 0
    func load() {
        loadCount += 1
    }
}
