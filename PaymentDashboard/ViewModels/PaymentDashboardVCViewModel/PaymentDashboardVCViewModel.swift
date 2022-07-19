import UIKit

final class PaymentDashboardVCViewModel: BasicViewModel {
    //MARK: - Properties
    private let cellIdentifier = PersonInfoTableViewCell.identifier
    private let chartViewDataService = PaymentInfoChartDataEntryManager()
    private var paymentInfo = [PaymentInfo]()
    
    //MARK: - Flow functions
    func loadData(completion: (() -> Void)) {
        guard let objects = try? dataBaseManager.loadObjects(with: PaymentInfo.self) else {
            completion()
            return
        }
        if objects.isEmpty {
            dataBaseManager.saveObjectsToRealm(PaymentDataInfo.paymentData)
            let savedObjects = try? dataBaseManager.loadObjects(with: PaymentInfo.self)
            guard let savedObjects = savedObjects else {
                completion()
                return
            }
            paymentInfo = savedObjects
        } else {
            paymentInfo = objects
        }
        completion()
    }
    
    func getPaymentInfo() -> [PaymentInfo] {
        paymentInfo
    }
    
    func configureChartContainerView(_ chartContainerView: ChartContainerView) {
        chartContainerView.configureChartName(with: "Collections")
        let chartData = chartViewDataService.getPaymentInfoDataEntry(from: paymentInfo)
        chartContainerView.configureChart(with: chartData)
    }
    
    func configureHeaderView(_ headerView: HeaderView) {
        headerView.configureHeader(with: "Payment Dashboard")
    }
    
    func getCellIdentifier() -> String {
        cellIdentifier
    }
}
