//
//  PersonsView.swift
//  totalBill
//
//  Created by Andrei Sergienko on 10.10.2022.
//

import UIKit

class PeraonsView: UIView{
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Persons"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.font = UIFont(name:  "Avenir Next", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let bacgroundGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 80)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.tintColor = #colorLiteral(red: 0.3764705882, green: 0.4196078431, blue: 0.4901960784, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 50)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = #colorLiteral(red: 0.2454499006, green: 0.2894837558, blue: 0.3496103287, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name:  "Avenir Next", size: 48)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(bacgroundGrayView)
        bacgroundGrayView.addSubview(minusButton)
        bacgroundGrayView.addSubview(plusButton)
        bacgroundGrayView.addSubview(counterLabel)

    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
            bacgroundGrayView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            bacgroundGrayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            bacgroundGrayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            bacgroundGrayView.heightAnchor.constraint(equalToConstant: 100),
            
            minusButton.topAnchor.constraint(equalTo: bacgroundGrayView.topAnchor, constant: 0),
            minusButton.leadingAnchor.constraint(equalTo: bacgroundGrayView.leadingAnchor, constant: 0),
            minusButton.heightAnchor.constraint(equalTo:bacgroundGrayView.heightAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 80),
            
            plusButton.topAnchor.constraint(equalTo: bacgroundGrayView.topAnchor, constant: 0),
            plusButton.trailingAnchor.constraint(equalTo: bacgroundGrayView.trailingAnchor, constant: 0),
            plusButton.heightAnchor.constraint(equalTo:bacgroundGrayView.heightAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 80),
            
            counterLabel.centerYAnchor.constraint(equalTo: bacgroundGrayView.centerYAnchor),
            counterLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 10),
            counterLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -10)
            ])
        
    }
    
}
