import UIKit

enum ImageAssetService {
    //MARK: - Payment Status
    case succeeded
    case pending
    
    //MARK: - Credentials
    case mail
    case phone
    
    func getImage() -> UIImage? {
        switch self {
        //MARK: - Payment Status Icons
        case .succeeded:
            return UIImage(named: "succeeded")
        case .pending:
            return UIImage(named: "pending")
            
        //MARK: - Credentials Icons
        case .mail:
            return UIImage(named: "mail")
        case .phone:
            return UIImage(named: "phone")
        }
    }
}
