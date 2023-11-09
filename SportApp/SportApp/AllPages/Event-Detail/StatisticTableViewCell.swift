//
//  StatisticTableViewCell.swift
//  SportApp
//
//  Created by m223 on 09.11.2023.
//

import UIKit

class StatisticTableViewCell: UITableViewCell {
    
    static let cellId = "StatisticTableViewCell"
    
    private let firstNumberOfCell = UILabel()
    private let secondNumberOfCell = UILabel()
    
    
    private let nameOftypeCell = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = Resourses.Colors.backgroundColorOfTableView
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        firstNumberOfCell.translatesAutoresizingMaskIntoConstraints = false
        firstNumberOfCell.text = "first"
        
        secondNumberOfCell.translatesAutoresizingMaskIntoConstraints = false
        secondNumberOfCell.text = "second"
        
        nameOftypeCell.translatesAutoresizingMaskIntoConstraints = false
        nameOftypeCell.text = "Type"
        
        
    }
    
    private func setupLayouts() {
        addSubview(firstNumberOfCell)
        addSubview(secondNumberOfCell)
        addSubview(nameOftypeCell)

        let constantLineIndents: CGFloat = 15

        NSLayoutConstraint.activate([
            
            firstNumberOfCell.centerYAnchor.constraint(equalTo: centerYAnchor),
            firstNumberOfCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: constantLineIndents),
            
            secondNumberOfCell.centerYAnchor.constraint(equalTo: centerYAnchor),
            secondNumberOfCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constantLineIndents),
            
            nameOftypeCell.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameOftypeCell.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        
        ])
    }
    
    func configureCell(modelOfStatistic: MockStructForStatistic, typeOfCell: String) {
        
        firstNumberOfCell.text = "\(modelOfStatistic.firstItem)"
        
        secondNumberOfCell.text = "\(modelOfStatistic.secondItem)"
        
        nameOftypeCell.text = typeOfCell
        
        
    }
}
