//
//  EmployeeCell.swift
//  EmployeeDisplayApp
//
//  Created by Abouzar Moradian on 9/18/24.
//

import UIKit

class EmployeeCell: UITableViewCell {
    
    var model: Employee? {
        
        didSet{
            emailLabel.text = model?.email
            nameLabel.text = model?.name
            cityLabel.text = model?.address.city
        }
    }
    static let identifier = "EmployeeCell"

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
