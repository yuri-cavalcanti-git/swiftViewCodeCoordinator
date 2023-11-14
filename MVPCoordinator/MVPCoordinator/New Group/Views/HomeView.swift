import UIKit

final class HomeView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .cyan
        label.textColor = .blue
        return label
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
        addSubview(label)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func bindLayoutEvents() {}
}

extension HomeView: HomeViewType {
    func show(text: String) {
        label.text = text
    }
}
