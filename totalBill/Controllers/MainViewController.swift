//
//  ViewController.swift
//  totalBill
//
//  Created by Andrei Sergienko on 29.09.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    let titleLabel: UILabel = {
         let label = UILabel()
        label.text = "Total Bill"
        label.textColor = .black
        label.font = UIFont(name:  "Avenir Next", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let descriptionLabel: UILabel = {
         let label = UILabel()
        label.text = "Enter the invoice amount and click \"Calculate\""
        label.textColor = .black
        label.font = UIFont(name:  "Avenir Next black", size: 15)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CALCULATE", for: .normal)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.5647058824, green: 0.1529411765, blue: 0.7450980392, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 20)
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func calculateButtonTapped() {
        guard let totalBill = totalBillView.summTextField.text,
              let totalBillInt = Int(totalBill) else { return }
        
        let summ = totalBillInt + totalBillInt * tipsView.tipsCount / 100
        let persons = personsView.counter
        
        if persons == 0 {
            descriptionLabel.text = "Enter persons count"
            descriptionLabel.textColor = .red
        } else {
            let result = summ / persons
            descriptionLabel.text = "\(result) per persons"
            descriptionLabel.textColor = .black
        }
        
    }
    
    func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    let totalBillView = TotalBillView()
    let personsView = PersonsView()
    let tipsView = TipsView()
    
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setContstraints()
        addTap()
    }
    
    
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.911803782, green: 0.911803782, blue: 0.911803782, alpha: 1)
        
        view.addSubview(titleLabel)
        view.addSubview(logoImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(totalBillView)
        view.addSubview(personsView)
        view.addSubview(calculateButton)
        view.addSubview(tipsView)
        
    }

}

extension MainViewController {
    
    func setContstraints () {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10 ),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            logoImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            
            descriptionLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            totalBillView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            totalBillView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            totalBillView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            totalBillView.heightAnchor.constraint(equalToConstant: 130),
            
            personsView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 10),
            personsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            personsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            personsView.heightAnchor.constraint(equalToConstant: 130),
            
            tipsView.topAnchor.constraint(equalTo: personsView.bottomAnchor, constant: 10),
            tipsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tipsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tipsView.heightAnchor.constraint(equalToConstant: 130),
            
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 60),
        ])
        
    }
    
}
