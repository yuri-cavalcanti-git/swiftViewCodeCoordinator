import UIKit

@testable import MVPCoordinator

final class HomeViewControllerSpy: UIViewController, HomeViewControllerType {
    private(set) var showParam = [HomeViewState]()
    func show(state: HomeViewState) {
        showParam.append(state)
    }
}
