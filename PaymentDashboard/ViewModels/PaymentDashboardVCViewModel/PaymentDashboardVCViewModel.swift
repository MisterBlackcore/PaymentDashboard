import UIKit

protocol PaymentDashboardViewModelProtocol {
    var paymentInfoModel: [PaymentInfo] { get }
    func loadData(completion: (() -> Void))
    func getChartData() -> ChartViewData
}

final class PaymentDashboardVCViewModel: PaymentDashboardViewModelProtocol {
    //MARK: - Properties
    private let dataBaseManager = DataBaseManager()
    private let chartViewDataService = PaymentInfoChartDataEntryManager()
    var paymentInfoModel = [PaymentInfo]()
    
    //MARK: - Functions
    func loadData(completion: (() -> Void)) {
        guard let objects = try? dataBaseManager.loadObjects(with: PaymentInfo.self) else {
            completion()
            return
        }
        paymentInfoModel = objects.isEmpty ? saveAndGetObjectsIfRealmIsEmprty() : objects
        completion()
    }
    
    private func saveAndGetObjectsIfRealmIsEmprty() -> [PaymentInfo] {
        dataBaseManager.saveObjectsToRealm(PaymentDataInfo.paymentData)
        let objects = try? dataBaseManager.loadObjects(with: PaymentInfo.self)
        return objects ?? []
    }
    
    func getChartData() -> ChartViewData {
        chartViewDataService.getPaymentInfoDataEntry(from: paymentInfoModel)
    }
}
