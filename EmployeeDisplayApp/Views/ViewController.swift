//
//  ViewController.swift
//  EmployeeDisplayApp
//
//  Created by Abouzar Moradian on 9/18/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    var viewModel = EmployeeViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        registerEmployeeCell()
        callApi()
        
    }
    
    func registerEmployeeCell(){
        let nib = UINib(nibName: EmployeeCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: EmployeeCell.identifier)
    }
    
    func callApi(){
        
        viewModel.fetchEmployees { [weak self] result in
            
            switch result {
            case .success(let employees):
                
                DispatchQueue.main.async {
                    
                    self?.viewModel.employees = employees
                    self?.tableView.reloadData()

                }
            case .failure(let failure):
                print("failed")
            }
            
        }
    }
    
    
}

extension  ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeCell.identifier, for: indexPath) as? EmployeeCell else { return UITableViewCell()}
        
        cell.model = viewModel.employees[indexPath.row]
        return cell
    }
   
}



extension  ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let cell = tableView.cellForRow(at: indexPath)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailScreen = storyboard.instantiateViewController(identifier: "DetailScreenVC") as? DetailScreenVC else {return}
    
        let employee = viewModel.employees[indexPath.row]
        
        detailScreen.viewModel = EmployeeDetailViewModel(employee: employee)
        navigationController?.pushViewController(detailScreen, animated: true)
        
    }
}

