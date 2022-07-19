import UIKit

enum FontService {
    case sourceSanProLight
    case sourceSanProExtraLight
    case sourceSanProRegular
    
    func getFont(size: CGFloat) -> UIFont? {
        switch self {
        case .sourceSanProExtraLight:
            return UIFont(name: "SourceSansPro-ExtraLight", size: size)
        case .sourceSanProLight:
            return UIFont(name: "SourceSansPro-Light", size: size)
        case .sourceSanProRegular:
            return UIFont(name: "SourceSansPro-Regular", size: size)
        }
    }
}
