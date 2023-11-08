//
//  MainCollectionViewCell.swift
//  SportApp
//
//  Created by m223 on 08.11.2023.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "MainCollectionViewCell"
    
    
    private let footballDevisionLabel = UILabel()
    
    private let mainStackView = UIStackView()
    
    private let timeOfMatchOrScoreInLiveLabel = UILabel()

    private let dateOfMatchLabel = UILabel()
    
    private let firstTeamStackView = UIStackView()
    
    private let iconOfFirstTeamImage = UIImageView()
    
    private let nameOfFirstTeamLabel = UILabel()
    
    private let secondTeamStackView = UIStackView()
    
    private let iconOfSecondTeamImage = UIImageView()
    
    private let nameOfSecondTeamLabel = UILabel()
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        
        backgroundColor = Resourses.Colors.backgroundColorOfCollectionViewCell
        
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupViews
    
    private func setupViews() {
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .horizontal
        mainStackView.alignment = .center
        mainStackView.distribution = .fillProportionally
        mainStackView.spacing = 0

        
        timeOfMatchOrScoreInLiveLabel.text = "12:00"
        timeOfMatchOrScoreInLiveLabel.textColor = .white
        timeOfMatchOrScoreInLiveLabel.font = .boldSystemFont(ofSize: 24)
        timeOfMatchOrScoreInLiveLabel.textAlignment = .center
        
        
        footballDevisionLabel.translatesAutoresizingMaskIntoConstraints = false
        footballDevisionLabel.text = "Premier League"
        footballDevisionLabel.textColor = .white
        footballDevisionLabel.font = .systemFont(ofSize: 14)
        
        dateOfMatchLabel.translatesAutoresizingMaskIntoConstraints = false
        dateOfMatchLabel.text = "8 july, 18:00"
        dateOfMatchLabel.textColor = .white
        dateOfMatchLabel.font = .systemFont(ofSize: 14)
        
        //MARK: firstTeamStackView
        firstTeamStackView.alignment = .fill
        firstTeamStackView.axis = .vertical
        firstTeamStackView.distribution = .fillProportionally
        firstTeamStackView.spacing = 5
        
        nameOfFirstTeamLabel.text = "Royal Phoenix FC"
        nameOfFirstTeamLabel.textAlignment = .center
        nameOfFirstTeamLabel.font = .boldSystemFont(ofSize: 12)

        iconOfFirstTeamImage.image = UIImage(named: "image")
        iconOfFirstTeamImage.contentMode = .scaleAspectFit

        
        //MARK: secondTeamStackView
        secondTeamStackView.alignment = .fill
        secondTeamStackView.axis = .vertical
        secondTeamStackView.distribution = .fillProportionally
        secondTeamStackView.spacing = 5
        
        nameOfSecondTeamLabel.text = "Royal Phoenix FC"
        nameOfSecondTeamLabel.textAlignment = .center
        nameOfSecondTeamLabel.font = .boldSystemFont(ofSize: 12)
        
        iconOfSecondTeamImage.image = UIImage(named: "image")
        iconOfSecondTeamImage.contentMode = .scaleAspectFit

        
        
    }
    
    //MARK: - setupLayouts

    private func setupLayouts() {
        addSubview(footballDevisionLabel)
        addSubview(dateOfMatchLabel)
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(firstTeamStackView)
        mainStackView.addArrangedSubview(timeOfMatchOrScoreInLiveLabel)
        mainStackView.addArrangedSubview(secondTeamStackView)
        
        //first team stackView
        firstTeamStackView.addArrangedSubview(iconOfFirstTeamImage)
        firstTeamStackView.addArrangedSubview(nameOfFirstTeamLabel)

        //second team stackView
        secondTeamStackView.addArrangedSubview(iconOfSecondTeamImage)
        secondTeamStackView.addArrangedSubview(nameOfSecondTeamLabel)

        
        let constantLineIndents: CGFloat = 15

        NSLayoutConstraint.activate([
            
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainStackView.heightAnchor.constraint(equalToConstant: frame.height / 4 * 2.25),
            mainStackView.widthAnchor.constraint(equalToConstant: frame.width - 2*constantLineIndents),
        
            footballDevisionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            footballDevisionLabel.bottomAnchor.constraint(equalTo: mainStackView.topAnchor),
            
            dateOfMatchLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateOfMatchLabel.topAnchor.constraint(equalTo: mainStackView.bottomAnchor),
            
            
        ])
        
    }
}
