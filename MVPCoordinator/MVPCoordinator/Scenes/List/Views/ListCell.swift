import UIKit

final class ListCell: UITableViewCell {
    private let listCellView = ListCellView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        selectionStyle = .none
        buildViewHierachy()
        addConstraints()
    }
    
    private func buildViewHierachy() {
        contentView.addSubview(listCellView)
    }
    
    private func addConstraints() {
        listCellView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func show(languageName: String) {
        listCellView.show(languageName: languageName)
    }
}
