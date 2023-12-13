import UIKit

class SettingsViewController: UIViewController {
    weak var delegate: SettingsViewControllerDelegate?
    
    private let contentView: SettingsViewType
    private let presenter: SettingsPresenterType
    
    init (contentView: SettingsViewType,
          presenter: SettingsPresenterType) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavBar(title: "Settings",
                    backgroundColor: .purple,
                    titleColor: .white,
                    tintColor: .black)
    }
    
    private func bindLayoutEvents() {
        contentView.didTapButton = { [weak self] in
            self?.delegate?.presentListView()
        }
    }
}

extension SettingsViewController: SettingsViewControllerType {
    func show(titleText: String?) {
        contentView.show(titleText: titleText)
    }
}

extension SettingsViewController: ListUpdateListener {
    func updateTitle(language: String) {
        contentView.show(titleText: language)
    }
}
