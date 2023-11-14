import UIKit

class HomeViewController: UIViewController {
    weak var delegate: HomeViewControllerDelegate?
    
    private let contentView: HomeViewType
    private let presenter: HomePresenterType
    
    init (contentView: HomeViewType,
          presenter: HomePresenterType) {
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
    }
}

extension HomeViewController: HomeViewControllerType {
    func show(text: String) {
        contentView.show(text: text)
    }
}
