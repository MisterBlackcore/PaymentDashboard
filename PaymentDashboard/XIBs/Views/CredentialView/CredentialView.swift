import UIKit

enum CredentialOption {
    case phone
    case mail
    
    func getImage() -> UIImage? {
        switch self {
        case .phone:
            return ImageAssetService.phone.getImage()
        case .mail:
            return ImageAssetService.mail.getImage()
        }
    }
    
    func getStringUrl(with text: String) -> String? {
        switch self {
        case .phone:
            return "tel://\(text)"
        case .mail:
            return "mailto:\(text)"
        }
    }
}

@IBDesignable
class CredentialView: UIView {
    //MARK: - Outlets
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var credentialIconImageView: UIImageView!
    @IBOutlet private weak var credentialInfoLabel: UILabel!
    
    //MARK: - Properties
    private var credentialAction: (()->())?
    
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
        let bundle = Bundle(for: CredentialView.self)
        bundle.loadNibNamed("CredentialView", owner: self)
        contentView.fixInView(self)
        setupCredentialInfoLabelAttributes()
    }
    
    private func setupCredentialInfoLabelAttributes() {
        credentialInfoLabel.font = FontService.sourceSanProExtraLight.getFont(size: 14)
        credentialInfoLabel.adjustsFontSizeToFitWidth = true
    }
    
    //MARK: - Actions
    @IBAction private func credentialInfoIsPressed(_ sender: UIButton) {
        credentialAction?()
    }
    
    //MARK: - Functions
    func configure(with text: String?, option: CredentialOption) {
        self.isHidden = text == nil
        guard let text = text else {
            return
        }
        credentialIconImageView.image = option.getImage()
        credentialInfoLabel.text = text
        setupCredentialAction(with: option)
    }
    
    private func setupCredentialAction(with option: CredentialOption) {
        guard let text = credentialInfoLabel.text else {
            return
        }
        let stringUrl = option.getStringUrl(with: text)
        guard let stringUrl = stringUrl, let url = URL(string: stringUrl) else {
            return
        }
        credentialAction = {
            UIApplication.shared.open(url)
        }
    }
}
