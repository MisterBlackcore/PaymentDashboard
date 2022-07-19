import UIKit

extension UIView {
    func fixInView(_ container: UIView) {
        container.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        self.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
    }
}
