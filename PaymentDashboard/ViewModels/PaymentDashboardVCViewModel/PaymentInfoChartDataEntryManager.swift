import UIKit
import Charts

final class PaymentInfoChartDataEntryManager {
    //MARK: - Functions
    func getPaymentInfoDataEntry(from paymentInfo: [PaymentInfo]) -> ChartViewData {
        let groupedPaymentInfo = Dictionary(grouping: paymentInfo) { DateFormatManager.getStringMonthDayDate(from: $0.paymentDate)
        }
        let sortedPaymentInfo = groupedPaymentInfo.sorted(by: { $0.0 < $1.0 })
        let chartViewData = ChartViewData(chartViewData: createPaymentInfoChartDataEntry(from: sortedPaymentInfo))
        return chartViewData
    }
    
    private func createPaymentInfoChartDataEntry(from dictionary: [Dictionary<String, [PaymentInfo]>.Element]) -> [ChartDataEntry] {
        var chartDataEntryItems = [ChartDataEntry]()
        var totalAmount: Double = 0
        for (index, dayPaymentInfo) in dictionary.enumerated() {
            let chartDataEntry = ChartDataEntry()
            chartDataEntry.x = Double(index)
            dayPaymentInfo.value.forEach { payment in
                totalAmount += payment.amount
            }
            chartDataEntry.y = totalAmount
            chartDataEntry.data = dayPaymentInfo.key
            chartDataEntryItems.append(chartDataEntry)
        }
        return chartDataEntryItems
    }
}
