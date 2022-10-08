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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setContstraints()
    }
    
    
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        view.addSubview(titleLabel)
        
    }

}

extension MainViewController {
    
    func setContstraints () {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10 ),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }
    
}
