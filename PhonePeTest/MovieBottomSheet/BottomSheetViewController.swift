

import UIKit

final class BottomSheetViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let viewModel = BottomListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        UISetUp()
        viewModel.loadPlayListData()
        tableView.reloadData()
    }
    
    
    private func UISetUp() {
        tableView.dm_registerClassWithDefaultIdentifierForNib(cellClass: BottomCell.self)
    }
    
    @IBAction
    func newPlayList(_ sender: UIButton) {
          var textField = UITextField()
          
          let alert = UIAlertController(title: "Add new Playlist", message: "", preferredStyle: .alert)
          alert.addTextField { alertTextField in
              alertTextField.placeholder = "Create new Playlist"
              
              textField = alertTextField
          }
          
          let action = UIAlertAction(title: "Add Playlist", style: .default) { action in
              print(textField.text!)
          }
          
          alert.addAction(action)
          present(alert, animated: true, completion: nil)
    }

}


extension BottomSheetViewController: UITableViewDelegate,
                       UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.playlistData.keys.count
    }
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let bottomCell: BottomCell = tableView.dm_dequeueReusableCellWithDefaultIdentifier()
        
        let keys = Array(viewModel.playlistData.keys)
        
        bottomCell.configure(keys[indexPath.item])
        
        return bottomCell
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
}
