import UIKit

final class DateFormatManager {
    //MARK: - Date Fromatters
    static private func currentDayHourFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH.mm aa"
        return dateFormatter
    }
    
    static private func monthDayFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        return dateFormatter
    }
    
    //MARK: - Date Converters
    static func getStringDateForPayment(from date: Date) -> String {
        Calendar.current.isDateInToday(date) ? currentDayHourFormatter().string(from: date) : getStringMonthDayDate(from: date)
    }
    
    static func getStringMonthDayDate(from date: Date) -> String {
        monthDayFormatter().string(from: date)
    }
}
