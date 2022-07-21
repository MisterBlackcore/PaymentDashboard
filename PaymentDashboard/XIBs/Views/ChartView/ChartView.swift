import UIKit
import Charts

enum ChartConfiguration {
    case paymentInfo
}

@IBDesignable
final class ChartView: UIView {
    //MARK: - Outlets
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var chartNameLabel: UILabel!
    @IBOutlet private weak var chartView: LineChartView!
    
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
        let bundle = Bundle(for: ChartView.self)
        bundle.loadNibNamed("ChartView", owner: self)
        contentView.fixInView(self)
        configureChartView()
    }
    
    private func configureChartView() {
        chartView.legend.enabled = false
        
        let rightAxis = chartView.rightAxis
        rightAxis.enabled = true
        rightAxis.drawAxisLineEnabled = false
        rightAxis.setLabelCount(4, force: true)
        
        chartView.leftAxis.enabled = false
        
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.avoidFirstLastClippingEnabled = true
        xAxis.drawGridLinesEnabled = false
        
        chartView.isUserInteractionEnabled = false
    }
    
    //MARK: - Functions
    func configureChartName(with title: String, font: UIFont? = FontService.sourceSanProRegular.getFont(size: 20), textColor: UIColor = .black) {
        chartNameLabel.text = title
        chartNameLabel.font = font
        chartNameLabel.textColor = textColor
    }
    
    func configureChart(with chartViewData: ChartViewData, option: ChartConfiguration) {
        let data = chartViewData.chartViewData
        applyChartConfiguration(option: option, data: data)
        let set = configureSet(with: data)
        let chartViewData = configureLineChartData(with: set)
        chartView.data = chartViewData
    }
    
    private func applyChartConfiguration(option: ChartConfiguration, data: [ChartDataEntry]) {
        switch option {
        case .paymentInfo:
            configurePaymentAxises(with: data)
        }
    }
    
    private func configurePaymentAxises(with data: [ChartDataEntry]) {
        var stringXAxisData = [String]()
        for element in data {
            if let elementData = element.data as? String {
                stringXAxisData.append(elementData)
            }
        }
        chartView.xAxis.valueFormatter = ChartValueFromatter.getBasicStringValueFormatter(for: stringXAxisData)
        chartView.rightAxis.valueFormatter = ChartValueFromatter.getDollarValueFormatter()
        chartView.rightAxis.axisMinimum = 0
        let maxLabelCount = 8
        let currentLabelCount = data.count < 8 ? data.count : maxLabelCount
        chartView.xAxis.setLabelCount(currentLabelCount, force: true)
    }
    
    private func configureSet(with data: [ChartDataEntry]) -> LineChartDataSet {
        let set = LineChartDataSet(entries: data)
        set.drawCirclesEnabled = false
        set.mode = .linear
        set.lineWidth = 4
        set.setColor(.black)
        return set
    }
    
    private func configureLineChartData(with set: LineChartDataSet) -> LineChartData {
        let lineChartData = LineChartData(dataSet: set)
        lineChartData.setDrawValues(false)
        return lineChartData
    }
}
