import UIKit
import Charts

final class ChartValueFromatter {
    //MARK: - Functions
    static func getBasicStringValueFormatter(for stringArray: [String]) -> AxisValueFormatter {
        let basicValueFromatter = BasicStringValueFromatter(stringArray: stringArray)
        return basicValueFromatter
    }
    
    static func getDollarValueFormatter() -> AxisValueFormatter {
        DollarYAxisValueFormatter()
    }
}

//MARK: - BasicStringValueFromatter
final private class BasicStringValueFromatter: AxisValueFormatter {
    //MARK: - Properties
    let stringArray: [String]
    
    //MARK: - Intitializators
    init(stringArray: [String]) {
        self.stringArray = stringArray
    }
    
    //MARK: - Functions
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return stringArray[Int(value)]
    }
}

//MARK: - DollarYAxisValueFormatter
final private class DollarYAxisValueFormatter : NSObject, AxisValueFormatter {
    //MARK: - Functions
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return getStringFromValue(value: value)
    }
    
    private func getStringFromValue(value: Double) -> String {
        return value < 1000 ? "$\(Int(value))" : "$\(Int(value / 1000))K"
    }
}



