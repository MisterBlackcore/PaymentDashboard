import UIKit
import RealmSwift

class PaymentInfo: Object {
    //MARK: - Properties
    @objc dynamic var payerName: String = ""
    @objc dynamic var payerEmail: String?
    @objc dynamic var payerPhone: String?
    @objc dynamic var amount: Double = 0.0
    @objc dynamic var paymentDate: Date = Date()
    @objc dynamic var status: String = ""
    
    //MARK: - Initializators
    convenience init(payerName: String, payerEmail: String?, payerPhone: String?, amount: Double, paymentDate: Date, status: String) {
        self.init()
        self.payerName = payerName
        self.payerEmail = payerEmail
        self.payerPhone = payerPhone
        self.amount = amount
        self.paymentDate = paymentDate
        self.status = status
    }
}
