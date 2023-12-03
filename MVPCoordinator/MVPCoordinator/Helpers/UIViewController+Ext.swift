import UIKit

extension UIViewController {
    func setupNavBar(title: String? = "",
                     subtitle: String? = nil,
                     backgroundColor: UIColor = .white,
                     titleColor: UIColor? = nil,
                     subtitleColor: UIColor? = nil,
                     tintColor: UIColor? = .black,
                     barStyle: UIBarStyle = UIBarStyle.default) {
        
        var color: UIColor
        var titleView: UIView?
        
        if let title {
            color = titleColor ?? .black
            
            if let subtitle {
                if let titleView = navigationItem.titleView {
                    let titleLabel = titleView.subviews.first { $0.accessibilityIdentifier == "labelTitle" } as? UILabel
                    let subtitleLabel = titleView.subviews.first { $0.accessibilityIdentifier == "labelSubtitle" } as? UILabel
                    titleLabel?.text = title
                    subtitleLabel?.text = subtitle
                } else {
                    titleView = createTitleView(title: title,
                                                subtitle: subtitle,
                                                titleColor: titleColor,
                                                subtitleColor: subtitleColor,
                                                backgroundColor: backgroundColor)
                }
            } else {
                self.title = title
            }
        } else {
            self.title = ""
            color = .clear
        }
        
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.barTintColor = backgroundColor
        
        configure(barStyle: barStyle,
                  isTransLucent: false,
                  tintColor: tintColor,
                  titleView: titleView)
        
        hideBackBarButtonTitle()
    }
    
    func hideBackBarButtonTitle() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func createTitleView(title: String,
                                 subtitle: String,
                                 titleColor: UIColor? = .black,
                                 subtitleColor: UIColor? = .black,
                                 backgroundColor: UIColor? = .white) -> UIView {
        
        let titleLabel = UILabel()
        titleLabel.accessibilityIdentifier = "labelTitle"
        titleLabel.backgroundColor = backgroundColor
        titleLabel.textColor = titleColor
        
        let subtitleLabel = UILabel()
        subtitleLabel.accessibilityIdentifier = "labelSubtitle"
        subtitleLabel.backgroundColor = backgroundColor
        subtitleLabel.textColor = subtitleColor
        
        let titleStackView = UIStackView()
        titleStackView.accessibilityIdentifier = "stackTitle"
        titleStackView.axis = .vertical
        titleStackView.alignment = .center
        titleStackView.distribution = .fill
        
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(subtitleLabel)
        
        return titleStackView
    }
    
    private func configure(barStyle: UIBarStyle,
                           isTransLucent: Bool,
                           tintColor: UIColor?,
                           titleView: UIView? = nil) {
        
        navigationController?.navigationBar.barStyle = barStyle
        navigationItem.titleView = titleView
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = isTransLucent
        navigationController?.navigationBar.tintColor = tintColor
        setNeedsStatusBarAppearanceUpdate()
    }
}
