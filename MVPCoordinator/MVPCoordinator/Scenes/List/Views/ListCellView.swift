import UIKit

final class ListCellView: UIView {
    private let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.compact.right")
        return view
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
//        backgroundColor = .lightGray
        buildViewHierachy()
        addConstraints()
    }
    
    private func buildViewHierachy() {
        addSubview(label)
        addSubview(imageView)
    }
    
    private func addConstraints() {
        label.snp.makeConstraints { make in
            make.centerY.equalTo(imageView)
            make.leading.equalToSuperview().offset(4)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().inset(4)
            make.bottom.equalToSuperview().inset(4)
            make.size.equalTo(24)
        }
    }
    
    func show(languageName: String) {
        label.text = languageName
    }
}
