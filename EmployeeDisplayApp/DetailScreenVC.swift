//
//  DetailScreenVC.swift
//  EmployeeDisplayApp
//
//  Created by Abouzar Moradian on 9/18/24.
//

import UIKit

class DetailScreenVC: UIViewController {

    var viewModel: EmployeeDetailViewModel?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        registerDetailCell()
        registerProgrammaticCell()

    }
    
    func registerDetailCell(){
        
        let nib = UINib(nibName: EmployeeDetailCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: EmployeeDetailCell.identifier)
    }
    
    func registerProgrammaticCell(){
        
        tableView.register(ProgrammaticDetailCell.self, forCellReuseIdentifier: ProgrammaticDetailCell.identifier)
    }
    
   

}

extension  DetailScreenVC:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeDetailCell.identifier, for: indexPath) as? EmployeeDetailCell else { return UITableViewCell()}
        
        guard let programmaticCell = tableView.dequeueReusableCell(withIdentifier: ProgrammaticDetailCell.identifier, for: indexPath) as? ProgrammaticDetailCell else { return UITableViewCell()}
        
       
        
        cell.model = viewModel?.employee
        //programmaticCell.model = viewModel?.employee
        return cell
    }
    
}
    
