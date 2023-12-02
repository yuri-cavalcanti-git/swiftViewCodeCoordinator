import UIKit

final class SettingsView: UIView {
    var didTapButton: (() -> Void)?
    
    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("Next View", for: .normal)
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
        backgroundColor = .darkGray
        buildViewHierachy()
        addConstraints()
        bindLayoutEvents()
    }
    
    private func buildViewHierachy() {
        addSubview(button)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
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
    func show() {
    }
}
