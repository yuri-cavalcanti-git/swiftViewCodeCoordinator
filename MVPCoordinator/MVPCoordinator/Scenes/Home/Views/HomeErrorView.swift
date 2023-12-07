import UIKit
import SnapKit

final class HomeErrorView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
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
        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
        }
    }
    
    private func bindLayoutEvents() {}
    
    func show(error: String) {
        label.text = error
    }
}
