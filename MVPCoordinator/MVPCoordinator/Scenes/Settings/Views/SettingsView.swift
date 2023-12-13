import UIKit

final class SettingsView: UIView {
    var didTapButton: (() -> Void)?
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Show List", for: .normal)
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
        backgroundColor = .lightGray
        buildViewHierachy()
        addConstraints()
        bindLayoutEvents()
    }
    
    private func buildViewHierachy() {
        addSubview(label)
        addSubview(button)
    }
    
    private func addConstraints() {
        label.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
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
}

extension SettingsView: SettingsViewType {
    func show(titleText: String?) {
        label.text = titleText ?? "Update text"
    }
}
