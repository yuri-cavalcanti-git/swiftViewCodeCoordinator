import UIKit

final class ListView: UIView {
    var didTapLanguage: ((String) -> Void)? {
        get { listDataSource.didTapLanguage }
        set { listDataSource.didTapLanguage = newValue }
    }
    private let listDataSource: ListDataSourceDelegate
    
    private let containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Choose a language"
        label.font = UIFont.systemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    init(listDataSource: ListDataSourceDelegate = ListDataSourceDelegate()) {
        self.listDataSource = listDataSource
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .cyan
        buildViewHierachy()
        addConstraints()
        setupTableView()
    }
    
    private func buildViewHierachy() {
        containerStackView.addArrangedSubview(label)
        containerStackView.addArrangedSubview(tableView)
        addSubview(containerStackView)
    }
    
    private func addConstraints() {
        containerStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupTableView() {
        tableView.dataSource = listDataSource
        tableView.delegate = listDataSource
        listDataSource.registerCell(in: tableView)
        
    }
}

extension ListView: ListViewType {
    func show(list: [String]) {
        listDataSource.update(list: list)
        tableView.reloadData()
    }
}
