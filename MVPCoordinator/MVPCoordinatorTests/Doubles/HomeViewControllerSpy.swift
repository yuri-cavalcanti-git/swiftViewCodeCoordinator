import UIKit

@testable import MVPCoordinator

final class HomeViewControllerSpy: UIViewController, HomeViewControllerType {
    private(set) var textParam = [String]()
    func show(text: String) {
        textParam.append(text)
    }
}
