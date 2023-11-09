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
        
        layer.borderWidth = 1.0
        layer.borderColor = Resourses.Colors.borderOfCellOnEventDetail.cgColor

        
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
        timeOfMatchOrScoreInLiveLabel.font = Resourses.Fonts.pilatExtendedBlack
        timeOfMatchOrScoreInLiveLabel.textAlignment = .center
        
        
        footballDevisionLabel.translatesAutoresizingMaskIntoConstraints = false
        footballDevisionLabel.text = "Premier League"
        footballDevisionLabel.textColor = .white
        footballDevisionLabel.font = .systemFont(ofSize: 14)
        
        dateOfMatchLabel.translatesAutoresizingMaskIntoConstraints = false
        let dateOfMatch = "8 july,"
        let timeOfMatch = " 18:00"

        let attributedText = NSMutableAttributedString(string: dateOfMatch + timeOfMatch)

        attributedText.addAttribute(.foregroundColor, value: Resourses.Colors.dateOfMatch, range: NSRange(location: 0, length: dateOfMatch.count))

        attributedText.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: dateOfMatch.count, length: timeOfMatch.count))

        dateOfMatchLabel.attributedText = attributedText
        dateOfMatchLabel.font = .systemFont(ofSize: 14)
        
        //MARK: firstTeamStackView
        firstTeamStackView.alignment = .fill
        firstTeamStackView.axis = .vertical
        firstTeamStackView.distribution = .fillProportionally
        firstTeamStackView.spacing = 5
        
        nameOfFirstTeamLabel.text = "Royal Phoenix FC"
        nameOfFirstTeamLabel.textAlignment = .center
        nameOfFirstTeamLabel.font = Resourses.Fonts.SFProDisplaySemiboldItalicForNameOfTeamOnMainPage

        iconOfFirstTeamImage.image = Resourses.Image.imageOfTeam
        iconOfFirstTeamImage.contentMode = .scaleAspectFit

        
        //MARK: secondTeamStackView
        secondTeamStackView.alignment = .fill
        secondTeamStackView.axis = .vertical
        secondTeamStackView.distribution = .fillProportionally
        secondTeamStackView.spacing = 5
        
        nameOfSecondTeamLabel.text = "Royal Phoenix FC"
        nameOfSecondTeamLabel.textAlignment = .center
        nameOfSecondTeamLabel.font = Resourses.Fonts.SFProDisplaySemiboldItalicForNameOfTeamOnMainPage
        
        iconOfSecondTeamImage.image = Resourses.Image.imageOfTeam
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
