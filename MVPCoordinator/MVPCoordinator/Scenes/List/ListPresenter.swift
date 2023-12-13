import UIKit

final class ListPresenter {
    weak var controller: ListViewControllerType?
}

extension ListPresenter: ListPresenterType {
    func load() {
        let list = ["swift",
                    "kotlin",
                    "java",
                    "c#"
        ]
        controller?.show(list: list)
    }
}
