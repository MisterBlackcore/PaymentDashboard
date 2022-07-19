import UIKit

final class PaymentDashboardViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet private weak var headerView: HeaderView!
    @IBOutlet private weak var chartContainerView: ChartContainerView!
    @IBOutlet private weak var paymentDashboardTableView: UITableView!
    
    //MARK: - Properties
    private let viewModel = PaymentDashboardVCViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    
    //MARK: - Functions
    private func setupUI() {
        CellRegisterService.registerTableViewCell(in: paymentDashboardTableView, with: viewModel.getCellIdentifier())
        viewModel.configureHeaderView(headerView)
    }
    
    private func loadData() {
        viewModel.loadData { [weak self] in
            self?.setupViewsAfterLoading()
        }
    }
    
    private func setupViewsAfterLoading() {
        viewModel.configureChartContainerView(chartContainerView)
        paymentDashboardTableView.reloadData()
    }
}

//MARK: - PaymentDashboardViewController + UITableViewDelegate, UITableViewDataSource
extension PaymentDashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getPaymentInfo().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.getCellIdentifier(), for: indexPath) as? PersonInfoTableViewCell else {
            return UITableViewCell()
        }
        let model = viewModel.getPaymentInfo()[indexPath.row]
        cell.configureCell(with: model)
        return cell
    }
}

