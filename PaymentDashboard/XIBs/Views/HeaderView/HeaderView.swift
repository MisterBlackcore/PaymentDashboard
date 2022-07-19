import UIKit

@IBDesignable
class HeaderView: UIView {
    //MARK: - Outlets
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private var borderViews: [UIView]!
    
    //MARK: - View Configuration
    override init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commoninit()
    }
    
    private func commoninit() {
        let bundle = Bundle(for: HeaderView.self)
        bundle.loadNibNamed("HeaderView", owner: self)
        contentView.fixInView(self)
        setupViewAppearance()
    }
    
    private func setupViewAppearance() {
        for view in borderViews {
            view.backgroundColor = .black
        }
    }
    
    //MARK: - Functions
    func configureHeader(with text: String, font: UIFont? = FontService.sourceSanProRegular.getFont(size: 25), textColor: UIColor = .black) {
        headerLabel.text = text
        headerLabel.font = font
        headerLabel.textColor = textColor
    }
}
