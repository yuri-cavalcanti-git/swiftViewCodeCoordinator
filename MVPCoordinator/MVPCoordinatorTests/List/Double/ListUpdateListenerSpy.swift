import UIKit

@testable import MVPCoordinator

final class ListUpdateListenerSpy: UIViewController, ListUpdateListener {
    private(set) var updateTitleParam = [String]()
    func updateTitle(language: String) {
        updateTitleParam.append(language)
    }
}
