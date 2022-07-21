import UIKit

final class PaymentDashboardViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet private weak var headerView: HeaderView!
    @IBOutlet private weak var chartContainerView: ChartContainerView!
    @IBOutlet private weak var paymentDashboardTableView: UITableView!
    
    //MARK: - Properties
    private let viewModel: PaymentDashboardViewModelProtocol = PaymentDashboardVCViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    
    //MARK: - Functions
    private func setupUI() {
        headerView.configureHeader(with: "Payment Dashboard")
        CellRegisterService.registerTableViewCell(in: paymentDashboardTableView, with: PersonInfoTableViewCell.identifier)
    }
    
    private func loadData() {
        viewModel.loadData { [weak self] in
            self?.setupViewsAfterLoading()
        }
    }
    
    private func setupViewsAfterLoading() {
        setupChartContainerView()
        paymentDashboardTableView.reloadData()
    }
    
    private func setupChartContainerView() {
        chartContainerView.configureChartName(with: "Collections")
        chartContainerView.configureChart(with: viewModel.getChartData())
    }
}

//MARK: - PaymentDashboardViewController + UITableViewDelegate, UITableViewDataSource
extension PaymentDashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.paymentInfoModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonInfoTableViewCell.identifier, for: indexPath) as? PersonInfoTableViewCell else {
            return UITableViewCell()
        }
        let model = viewModel.paymentInfoModel[indexPath.row]
        cell.configureCell(with: model)
        return cell
    }
}

