import UIKit

final class HomePresenter {
    weak var controller: HomeViewControllerType?
    private let text: String
    
    init(text: String) {
        self.text = text
    }
}

extension HomePresenter: HomePresenterType {
    func load() {
        controller?.show(text: text)
    }
}
