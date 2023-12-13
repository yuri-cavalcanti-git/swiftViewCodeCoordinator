@testable import MVPCoordinator

final class ListViewControllerDelegateSpy: ListViewControllerDelegate {
    private(set) var updateTextParam = [String?]()
    func updateText(language: String) {
        updateTextParam.append(language)
    }
}
