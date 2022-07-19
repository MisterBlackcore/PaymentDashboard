import UIKit

final class CellRegisterService {
    //MARK: - Functions
    static func registerTableViewCell(in tableView: UITableView, with identifier: String) {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
}
