import UIKit

final class HomeView: UIView {
    var didTapButton: (() -> Void)?
    
    private let headerView = HomeHeaderView()
    private let loadingView = HomeLoadingView()
    private let errorView = HomeErrorView()
    private let readyView = HomeReadyView()
    
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("Try Again", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        return button
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
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
        bindLayoutEvents()
    }
    
    private func buildViewHierachy() {
        addSubview(headerView)
        addSubview(loadingView)
        addSubview(errorView)
        addSubview(readyView)
        addSubview(button)
    }
    
    private func addConstraints() {
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        loadingView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
        }
        
        errorView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(100)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
        }
        
        readyView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(100)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
        }
        
        button.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
    }
    
    private func bindLayoutEvents() {
        button.addTarget(self,
                         action: #selector(handleButtonTap),
                         for: .touchUpInside)
    }
    
    @objc
    private func handleButtonTap() {
        didTapButton?()
    }
    
    private func show(view: UIView) {
        let views = [loadingView, errorView, readyView]
        views.forEach {
            $0.isHidden = $0 != view
        }
    }
}

extension HomeView: HomeViewType {
    func show(state: HomeViewState) {
        switch state {
        case .loading:
            show(view: loadingView)
        case .error(let error):
            show(view: errorView)
            errorView.show(error: error)
        case .ready(let viewmodel):
            show(view: readyView)
            readyView.show(viewModel: viewmodel)
        }
    }
}
