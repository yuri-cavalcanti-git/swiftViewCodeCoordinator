import UIKit
import SnapKit

final class HomeLoadingView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Loading"
        label.font = UIFont.systemFont(ofSize: 40)
        label.textAlignment = .center
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
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    private func bindLayoutEvents() {}
}
