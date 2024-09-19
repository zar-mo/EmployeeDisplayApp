//
//  EmployeeDetailCell.swift
//  EmployeeDisplayApp
//
//  Created by Abouzar Moradian on 9/18/24.
//

import UIKit

class EmployeeDetailCell: UITableViewCell {
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var bsLabel: UILabel!
    @IBOutlet weak var catchPhraseLabel: UILabel!
    @IBOutlet weak var lgnLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var suiteLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    static let identifier = "EmployeeDetailCell"
    
    var model: Employee? {
        didSet {
            
            if let id = model?.id{
                idLabel.text = "ID#:" + String(id)
            }
            nameLabel.text = "name: \(model?.name ?? "")"
            phoneLabel.text = "phone number: \(model?.phone ?? "")"
            websiteLabel.text = "wensite: \(model?.website ?? "")"
            lgnLabel.text =  "longitude: \(model?.address.geo.lng ?? "")"
            latLabel.text = "latitude: \(model?.address.geo.lat ?? "")"
            bsLabel.text =   "bs: \(model?.company.bs ?? "")"
            catchPhraseLabel.text =   "catch phrase: \(model?.company.catchPhrase ?? "")"
            companyNameLabel.text =   "company name: \(model?.company.name ?? "")"
            zipcodeLabel.text =   "zipcode: \(model?.address.zipcode ?? "")"
            cityLabel.text =   "city: \(model?.address.city ?? "")"
            suiteLabel.text =   "suite: \(model?.address.suite ?? "")"
            streetLabel.text =   "street: \(model?.address.street ?? "")"
            emailLabel.text =   "email: \(model?.email ?? "")"
            usernameLabel.text =   "username: \(model?.username ?? "")"

        
        }
    }
    

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
