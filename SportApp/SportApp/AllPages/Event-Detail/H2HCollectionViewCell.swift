//
//  H2HCollectionViewCell.swift
//  SportApp
//
//  Created by m223 on 09.11.2023.
//


import UIKit

final class H2HCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "H2HCollectionViewCell"

    private let dateOfMatchLabel = UILabel()
    
    private let infoAboutMatchStackView = UIStackView()
    
    private let firstTeamNameLabel = UILabel()
    
    private let secondTeamNameLabel = UILabel()
    
    private let totalScoreButton = UIButton()

    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        
        backgroundColor = Resourses.Colors.colorOfCollectionViewCellEventDetailPage
        
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupViews
    
    private func setupViews() {
        

        dateOfMatchLabel.translatesAutoresizingMaskIntoConstraints = false
        dateOfMatchLabel.text = "8 july, 18:00"
        dateOfMatchLabel.textColor = Resourses.Colors.dateColorEventCell
        dateOfMatchLabel.font = .systemFont(ofSize: 14)
        
        infoAboutMatchStackView.translatesAutoresizingMaskIntoConstraints = false
        infoAboutMatchStackView.alignment = .center
        infoAboutMatchStackView.axis = .horizontal
        infoAboutMatchStackView.distribution = .fill
        infoAboutMatchStackView.spacing = 10
        
        firstTeamNameLabel.text = "Royal Phoenix FC"
        firstTeamNameLabel.textColor = .white
        
        totalScoreButton.setTitle("1 - 2", for: .normal)
        totalScoreButton.setTitleColor(Resourses.Colors.totalScoreButtonTitleColor, for: .normal)
        totalScoreButton.isEnabled = false
        var configurationForStatistic = UIButton.Configuration.plain()
        configurationForStatistic.titlePadding = 8
        configurationForStatistic.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16)
        
        totalScoreButton.configuration = configurationForStatistic
        totalScoreButton.backgroundColor = Resourses.Colors.backgroundColorOfScoreLabelInCellEventdetailPage
        totalScoreButton.layer.cornerRadius = 15
        
        secondTeamNameLabel.text = "Royal Phoenix FC"
        secondTeamNameLabel.textColor = .white
        
        

    }
    
    //MARK: - setupLayouts

    private func setupLayouts() {
        
        addSubview(dateOfMatchLabel)
        addSubview(infoAboutMatchStackView)
        infoAboutMatchStackView.addArrangedSubview(firstTeamNameLabel)
        infoAboutMatchStackView.addArrangedSubview(totalScoreButton)
        infoAboutMatchStackView.addArrangedSubview(secondTeamNameLabel)
        
        let constantLineIndents: CGFloat = 15
        let constantFromCenter: CGFloat = 5

        NSLayoutConstraint.activate([
            
            dateOfMatchLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -constantFromCenter),
            dateOfMatchLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        
            infoAboutMatchStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            infoAboutMatchStackView.topAnchor.constraint(equalTo: centerYAnchor, constant: constantFromCenter),
            infoAboutMatchStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: constantLineIndents),
            infoAboutMatchStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constantLineIndents),
            
        ])
        
    }
}
