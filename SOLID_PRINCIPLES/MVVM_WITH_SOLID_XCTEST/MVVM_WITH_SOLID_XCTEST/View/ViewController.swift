//
//  ViewController.swift
//  MVVM_WITH_SOLID_XCTEST
//
//  Created by Akash Revanna on 27/04/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    private var viewModel:UserViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        bindViewModel()
        viewModel.fetchUsers()
    }
    
    private func setup() {
        tableView.dataSource = self
        
        let service = UserService()
        viewModel = UserViewModel(service: service)
    }
    private func bindViewModel() {
        viewModel.onDataUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.onError = { error in
            print("Error: \(error)")
            
        }
    }


}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let user = viewModel.userAt(index: indexPath.row)
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
}
