import UIKit
import Charts

@IBDesignable
final class ChartContainerView: UIView {
    //MARK: - Outlets
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var chartView: ChartView!
    @IBOutlet private weak var separatorView: UIView!
    
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
        let bundle = Bundle(for: ChartContainerView.self)
        bundle.loadNibNamed("ChartContainerView", owner: self)
        contentView.fixInView(self)
        setupSeparatorView()
    }
    
    private func setupSeparatorView() {
        separatorView.backgroundColor = .black
        separatorView.layer.cornerRadius = 1
    }
    
    //MARK: - Functions
    func configureChartName(with title: String, font: UIFont? = FontService.sourceSanProRegular.getFont(size: 20), textColor: UIColor = .black) {
        chartView.configureChartName(with: title,
                                     font: font,
                                     textColor: textColor)
    }
    
    func configureChart(with chartViewData: ChartViewData) {
        chartView.configureChart(with: chartViewData, option: .paymentInfo)
    }
}
