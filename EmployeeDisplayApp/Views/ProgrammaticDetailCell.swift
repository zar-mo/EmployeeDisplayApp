//
//  ProgrammaticDetailCell.swift
//  EmployeeDisplayApp
//
//  Created by Abouzar Moradian on 9/18/24.
//

import UIKit

class ProgrammaticDetailCell: UITableViewCell {

    static let identifier = "ProgrammaticDetailCell"
    
    var basicInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.backgroundColor = .systemGray5
        label.text = "Basic Information"
        return label
    }()
    
    var addressInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.backgroundColor = .systemGray5
        label.text = "Basic Information"
        return label
    }()
    
    
    var nameAndIdContainer: UIView = {
        let container = UIView()
        return container
    }()
    
    var nameLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    var idLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    var emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    var websiteLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    
    var streetLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    var suiteLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    var cityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    var zipcodeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    var basicInfoStack: UIStackView = {
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
       
        return stack
    }()
    
    var addressStack: UIStackView = {
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
       
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        placeContents(contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func placeContents(_ view: UIView){
        
        view.addSubview(basicInfoStack)
        //view.addSubview(addressStack)

        view.addSubview(basicInfoLabel)
        view.addSubview(addressInfoLabel)


        
        basicInfoStack.addArrangedSubview(nameAndIdContainer)
        basicInfoStack.addArrangedSubview(usernameLabel)
        basicInfoStack.addArrangedSubview(emailLabel)
        basicInfoStack.addArrangedSubview(websiteLabel)
        
        addressStack.addArrangedSubview(streetLabel)
        addressStack.addArrangedSubview(suiteLabel)
        addressStack.addArrangedSubview(cityLabel)
        addressStack.addArrangedSubview(zipcodeLabel)
        
        
        nameAndIdContainer.addSubview(nameLable)
        nameAndIdContainer.addSubview(idLable)
        
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        idLable.translatesAutoresizingMaskIntoConstraints = false
        basicInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        addressStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            basicInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            basicInfoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            basicInfoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            
            basicInfoStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            basicInfoStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            basicInfoStack.topAnchor.constraint(equalTo: basicInfoLabel.bottomAnchor, constant: 10),
            
            nameLable.leadingAnchor.constraint(equalTo: nameAndIdContainer.leadingAnchor, constant: 0),
            nameLable.topAnchor.constraint(equalTo: nameAndIdContainer.topAnchor, constant: 0),
            
            idLable.trailingAnchor.constraint(equalTo: nameAndIdContainer.trailingAnchor, constant: 0),
            idLable.topAnchor.constraint(equalTo: nameAndIdContainer.topAnchor, constant: 0),
            
//            addressInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            addressInfoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            addressInfoLabel.topAnchor.constraint(equalTo: basicInfoStack.bottomAnchor, constant: 10),
//            
//            addressStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            addressStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            addressStack.topAnchor.constraint(equalTo: addressInfoLabel.bottomAnchor, constant: 10),

        ])
   
    }
    
    var model: Employee? {
        didSet{
            
            if let id = model?.id{
                idLable.text = String(id)
            }
            nameLable.text = model?.name
            usernameLabel.text = model?.username
            emailLabel.text = model?.email
            websiteLabel.text = model?.website
            zipcodeLabel.text = model?.address.zipcode
            cityLabel.text = model?.address.city
            suiteLabel.text = model?.address.suite
            streetLabel.text = model?.address.street

        }
    }
    


}
