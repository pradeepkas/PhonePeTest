


import UIKit


final class MovieListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterButton: UIButton!

    // later we can inject network request and other depencdies as well
    private let viewModel = MovieListViewModel()
    
    //MARK: view controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        UISetUp()
        stateMonitor()
        viewModel.fetchList()
    }
    
    private func stateMonitor() {
        viewModel.stateMonitor = { [weak self] state in
            guard let self = self else {return}
            if state.isLoading() {
                HUDIndicator.show(self.view)
            } else {
                HUDIndicator.dismiss()
            }
            switch state {
            case .data:
                self.tableView.reloadData()
            case .error(let erorr):
                self.tableView.reloadData()
                self.showError(erorr)
            default:
                break
            }
        }
    }

    
    private func UISetUp() {
        self.title = "Movie List"
        tableView.dm_registerClassWithDefaultIdentifierForNib(cellClass: MovieListCell.self)
        filterButton.layer.cornerRadius = 40
        filterButton.setTitle("", for: .normal)
    }
    
    
    // MARK: button actions

    @IBAction
    func filterButtonTapped(_ button: UIButton) {
        print("filterButtonTapped")
        showPlayList()
    }

     func showPlayList() {
        let selector = BottomSheetViewController.instantiateFromStoryboard()
        self.navigationController?.present(selector, animated: true)
    }


}


extension MovieListVC: UITableViewDelegate,
                       UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieList.count
    }
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movieCell: MovieListCell = tableView.dm_dequeueReusableCellWithDefaultIdentifier()
        
        movieCell.configure(viewModel.movieList[indexPath.item])
        
        return movieCell
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
}
