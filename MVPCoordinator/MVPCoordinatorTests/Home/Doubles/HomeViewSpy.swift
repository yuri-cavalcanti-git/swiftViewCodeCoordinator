import UIKit

@testable import MVPCoordinator

final class HomeViewSpy: UIView, HomeViewType {
    var didTapButton: (() -> Void)?
    
    private(set) var showParam = [HomeViewState]()
    func show(state: HomeViewState) {
        showParam.append(state)
    }
}
