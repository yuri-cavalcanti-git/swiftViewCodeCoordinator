import UIKit

class ListViewController: UIViewController {
    weak var delegate: ListViewControllerDelegate?
    
    private let contentView: ListViewType
    private let presenter: ListPresenterType
    
    init (contentView: ListViewType,
          presenter: ListPresenterType) {
        self.contentView = contentView
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
        bindLayoutEvents()
    }
    
    private func bindLayoutEvents() {
        contentView.didTapLanguage = { [weak self] language in
            self?.delegate?.updateText(language: language)
        }
    }
}

extension ListViewController: ListViewControllerType {
    func show(list: [String]) {
        contentView.show(list: list)
    }
}
