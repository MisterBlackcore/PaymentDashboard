import UIKit

enum PaymentStatus: String {
    case pending
    case succeeded
    
    func getImage() -> UIImage? {
        switch self {
        case .pending:
            return ImageAssetService.pending.getImage()
        case .succeeded:
            return ImageAssetService.succeeded.getImage()
        }
    }
}

final class PersonInfoTableViewCell: UITableViewCell {
    //MARK: - Properties
    @IBOutlet private weak var currentStatusImageView: UIImageView!
    @IBOutlet private weak var payerNameLabel: UILabel!
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var phoneNumberCredentialView: CredentialView!
    @IBOutlet private weak var emailCredentialView: CredentialView!
    @IBOutlet private weak var paymentDateLabel: UILabel!
    @IBOutlet private weak var separatorView: UIView!
    
    //MARK: - Properties
    static var identifier = "PersonInfoTableViewCell"
    
    //MARK: - Functions
    func configureCell(with paymentInfo: PaymentInfo) {
        setupLabelsAttributes()
        setupSeparatorView()
        
        payerNameLabel.text = paymentInfo.payerName
        amountLabel.text = "$" + String(format: "%.2f", paymentInfo.amount)
        setupCurrentStatusImageView(with: PaymentStatus.init(rawValue: paymentInfo.status))
        phoneNumberCredentialView.configure(with: paymentInfo.payerPhone, option: .phone)
        emailCredentialView.configure(with: paymentInfo.payerEmail, option: .mail)
        paymentDateLabel.text = DateFormatManager.getStringDateForPayment(from: paymentInfo.paymentDate)
    }
    
    private func setupLabelsAttributes() {
        payerNameLabel.font = FontService.sourceSanProLight.getFont(size: 20)
        amountLabel.font = FontService.sourceSanProLight.getFont(size: 20)
        paymentDateLabel.font = FontService.sourceSanProExtraLight.getFont(size: 14)
    }
    
    private func setupSeparatorView() {
        separatorView.layer.cornerRadius = 1
        separatorView.backgroundColor = .gray
    }
    
    private func setupCurrentStatusImageView(with option: PaymentStatus?) {
        guard let option = option else {
            return
        }
        currentStatusImageView.image = option.getImage()
    }
}
