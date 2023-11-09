//
//  EventDetailViewController.swift
//  SportApp
//
//  Created by m223 on 08.11.2023.
//

import UIKit

final class EventDetailViewController: UIViewController {
    
    //MARK: Custom Title Create
    private let customNavigationTitleView = UIView()
    private let customTitle = UILabel()

    private let topView = UIView()
    private let firstDecorationBall = UIImageView()
    private let secondDecorationBall = UIImageView()

    
    //MARK: DetailOfCuurenMatch create
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

    
    private let customBackButtom = UIButton()
    private let H2HButton = UIButton(type: .system)
    private let statisticButton = UIButton(type: .system)
    
    //MARK: H2HCollectionView and statisticTableView create
    private let H2HCollectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(H2HCollectionViewCell.self, forCellWithReuseIdentifier: H2HCollectionViewCell.cellId)
        return collectionView
        
        
    }()
    
    private let statisticTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Resourses.Colors.backgroundColor
        navigationItem.hidesBackButton = true

        
        setupViews()
        setupLayouts()
    }
    
    //MARK: - setupViews
    
    private func setupViews() {
        
        
        //MARK: customNavigation setup
        customNavigationTitleView.translatesAutoresizingMaskIntoConstraints = false
        navigationItem.titleView = customNavigationTitleView
        
        customTitle.translatesAutoresizingMaskIntoConstraints = false
        customTitle.text = "Detail Event"
        customTitle.font = Resourses.Fonts.pilatExtendedFontBlack
        customTitle.textAlignment = .center
        customTitle.textColor = .white
        
        customBackButtom.translatesAutoresizingMaskIntoConstraints = false
        customBackButtom.setImage(UIImage(named: "backButton"), for: .normal)
        customBackButtom.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        customBackButtom.tintColor = Resourses.Colors.backButtonColor

        
        //MARK: topView and both DecorationBall setup
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = Resourses.Colors.backgroundColorOfCollectionViewCell
        topView.layer.zPosition = 0
        
        firstDecorationBall.image = UIImage(named: "ball1")
        firstDecorationBall.translatesAutoresizingMaskIntoConstraints = false
        firstDecorationBall.contentMode = .scaleAspectFill
        
        secondDecorationBall.image = UIImage(named: "ball2")
        secondDecorationBall.translatesAutoresizingMaskIntoConstraints = false
        secondDecorationBall.contentMode = .scaleAspectFill
        secondDecorationBall.layer.zPosition = 1
        
        //MARK: Detail Information In Top View Setup
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .horizontal
        mainStackView.alignment = .center
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 0

        
        timeOfMatchOrScoreInLiveLabel.text = "1 : 2"
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
        
        //MARK: firstTeamStackView setup
        firstTeamStackView.alignment = .fill
        firstTeamStackView.axis = .vertical
        firstTeamStackView.distribution = .fillProportionally
        firstTeamStackView.spacing = 5
        
        nameOfFirstTeamLabel.text = "Royal Phoenix FC"
        nameOfFirstTeamLabel.numberOfLines = 2
        nameOfFirstTeamLabel.textAlignment = .center
        nameOfFirstTeamLabel.font = .boldSystemFont(ofSize: 12)

        iconOfFirstTeamImage.image = UIImage(named: "image")
        iconOfFirstTeamImage.contentMode = .scaleAspectFit

        
        //MARK: secondTeamStackView setup
        secondTeamStackView.alignment = .fill
        secondTeamStackView.axis = .vertical
        secondTeamStackView.distribution = .fillProportionally
        secondTeamStackView.spacing = 5
        
        nameOfSecondTeamLabel.text = "Royal Phoenix FC"
        nameOfSecondTeamLabel.textAlignment = .center
        nameOfSecondTeamLabel.font = .boldSystemFont(ofSize: 12)
        
        iconOfSecondTeamImage.image = UIImage(named: "image")
        iconOfSecondTeamImage.contentMode = .scaleAspectFit

        //MARK: H2HButton and statisticButton setup
        H2HButton.translatesAutoresizingMaskIntoConstraints = false
        H2HButton.setTitle("H2H", for: .normal)
        H2HButton.backgroundColor = Resourses.Colors.h2hAndStatisticActivButtonColor
        H2HButton.setTitleColor(.white, for: .normal)
        H2HButton.layer.cornerRadius = 15
        var configurationForH2H = UIButton.Configuration.plain()
        configurationForH2H.titlePadding = 8
        configurationForH2H.contentInsets = NSDirectionalEdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10)
        
        H2HButton.configuration = configurationForH2H
        H2HButton.addTarget(self, action: #selector(tapH2HButton), for: .touchUpInside)
        
        statisticButton.translatesAutoresizingMaskIntoConstraints = false
        statisticButton.setTitle("Statistic", for: .normal)
        statisticButton.backgroundColor = Resourses.Colors.backgroundColorOfCollectionViewCell
        statisticButton.setTitleColor(.white, for: .normal)
        statisticButton.layer.cornerRadius = 15
        var configurationForStatistic = UIButton.Configuration.plain()
        configurationForStatistic.titlePadding = 8
        configurationForStatistic.contentInsets = NSDirectionalEdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10)
        
        statisticButton.configuration = configurationForStatistic

        statisticButton.addTarget(self, action: #selector(tapStatisticButton), for: .touchUpInside)
        
        
        //MARK: H2HCollectionView and statisticTableView setup
        H2HCollectionView.translatesAutoresizingMaskIntoConstraints = false
        H2HCollectionView.backgroundColor = Resourses.Colors.backgroundColorOfCollectionAndTableEventDetailPage
        H2HCollectionView.delegate = self
        H2HCollectionView.dataSource = self
        
        statisticTableView.translatesAutoresizingMaskIntoConstraints = false
        statisticTableView.delegate = self
        statisticTableView.dataSource = self
        statisticTableView.isHidden = true
        statisticTableView.backgroundColor = Resourses.Colors.backgroundColorOfCollectionAndTableEventDetailPage
        statisticTableView.register(StatisticTableViewCell.self, forCellReuseIdentifier: StatisticTableViewCell.cellId)
        
    }
    
    //MARK: - setupLayouts
    
    private func setupLayouts() {
        
        view.addSubview(topView)
        topView.addSubview(firstDecorationBall)
        topView.addSubview(secondDecorationBall)
        
        topView.addSubview(footballDevisionLabel)
        topView.addSubview(dateOfMatchLabel)
        topView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(firstTeamStackView)
        mainStackView.addArrangedSubview(timeOfMatchOrScoreInLiveLabel)
        mainStackView.addArrangedSubview(secondTeamStackView)
        
        //first team stackView
        firstTeamStackView.addArrangedSubview(iconOfFirstTeamImage)
        firstTeamStackView.addArrangedSubview(nameOfFirstTeamLabel)

        //second team stackView
        secondTeamStackView.addArrangedSubview(iconOfSecondTeamImage)
        secondTeamStackView.addArrangedSubview(nameOfSecondTeamLabel)


        view.addSubview(customNavigationTitleView)
        customNavigationTitleView.addSubview(customTitle)
        customNavigationTitleView.addSubview(customBackButtom)

        view.addSubview(H2HButton)
        view.addSubview(statisticButton)
        view.addSubview(H2HCollectionView)
        view.addSubview(statisticTableView)
        
        let constantLineIndents: CGFloat = 16
        
        NSLayoutConstraint.activate([
            
            topView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.widthAnchor.constraint(equalToConstant: view.frame.width),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),

            firstDecorationBall.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            firstDecorationBall.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            
            secondDecorationBall.topAnchor.constraint(equalTo: topView.topAnchor),
            secondDecorationBall.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            
            mainStackView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: dateOfMatchLabel.topAnchor, constant: -5),
        
            footballDevisionLabel.bottomAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -5),
            footballDevisionLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            
            dateOfMatchLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -constantLineIndents),
            dateOfMatchLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),

            customNavigationTitleView.topAnchor.constraint(equalTo: view.topAnchor),
            customNavigationTitleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavigationTitleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavigationTitleView.widthAnchor.constraint(equalToConstant: view.frame.width),
            customNavigationTitleView.heightAnchor.constraint(equalToConstant: 44),

            customTitle.centerXAnchor.constraint(equalTo: customNavigationTitleView.centerXAnchor),
            customTitle.bottomAnchor.constraint(equalTo: customNavigationTitleView.bottomAnchor),

            customBackButtom.leadingAnchor.constraint(equalTo: customNavigationTitleView.leadingAnchor, constant: constantLineIndents),
            customBackButtom.bottomAnchor.constraint(equalTo: customNavigationTitleView.bottomAnchor),
            customBackButtom.heightAnchor.constraint(equalToConstant: 24),
            customBackButtom.widthAnchor.constraint(equalToConstant: 24),
            
            H2HButton.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: constantLineIndents),
            H2HButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constantLineIndents),
            
            statisticButton.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: constantLineIndents),
            statisticButton.leadingAnchor.constraint(equalTo: H2HButton.trailingAnchor, constant: constantLineIndents),
            
            H2HCollectionView.topAnchor.constraint(equalTo: H2HButton.bottomAnchor, constant: constantLineIndents),
            H2HCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            H2HCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            H2HCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45),

            statisticTableView.topAnchor.constraint(equalTo: H2HButton.bottomAnchor, constant: constantLineIndents),
            statisticTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statisticTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statisticTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45),


        ])
        
        
    }
    
    //MARK: - Objc func
        
    
    //MARK: tapBackButton
    @objc func tapBackButton() {
        
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    //MARK: tapH2HButton
    @objc func tapH2HButton() {
        
        H2HButton.backgroundColor = Resourses.Colors.h2hAndStatisticActivButtonColor
        statisticButton.backgroundColor = Resourses.Colors.backgroundColorOfCollectionViewCell
        H2HCollectionView.isHidden = false
        statisticTableView.isHidden = true
        
    }
    
    //MARK: tapStatisticButton
    @objc func tapStatisticButton() {
        
        H2HButton.backgroundColor = Resourses.Colors.backgroundColorOfCollectionViewCell
        statisticButton.backgroundColor = Resourses.Colors.h2hAndStatisticActivButtonColor
        H2HCollectionView.isHidden = true
        statisticTableView.isHidden = false

        
    }
    
    
}

//MARK: - UICollectionViewDelegateFlowLayout

extension EventDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: view.frame.width - 2*15, height: collectionView.frame.height / 4.6)
    }
}


//MARK: - UICollectionViewDataSource

extension EventDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: H2HCollectionViewCell.cellId, for: indexPath) as? H2HCollectionViewCell
        
        cell?.layer.cornerRadius = 15
        
        return cell!
    }
    
    
    
}

//MARK: - UICollectionViewDelegate

extension EventDetailViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        
    }
    
}

//MARK: - UITableViewDelegate

extension EventDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 9
    }
    
}

//MARK: - UITableViewDataSource

extension EventDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StatisticTableViewCell.cellId, for: indexPath) as? StatisticTableViewCell
        
        cell?.configureCell(modelOfStatistic: mockArrayOfStatisticModel[indexPath.row], typeOfCell: mockTypeOfCell[indexPath.row])
        
        return cell!
        
        
    }
}


//MARK: mock data
let mockArrayOfStatisticModel: [MockStructForStatistic] = {
    
    let ballProfessionalTeam = MockStructForStatistic(firstItem: 55, secondItem: 45)
    let goalAttempsTeam = MockStructForStatistic(firstItem: 4, secondItem: 6)
    let shotsOnGoalTeam = MockStructForStatistic(firstItem: 2, secondItem: 3)
    let shotsOfGoalTeam = MockStructForStatistic(firstItem: 3, secondItem: 2)
    let freeKicksTeam = MockStructForStatistic(firstItem: 0, secondItem: 0)
    let offSideTeam = MockStructForStatistic(firstItem: 1, secondItem: 0)
    let yellowCardTeam = MockStructForStatistic(firstItem: 1, secondItem: 0)
    let redCardTeam = MockStructForStatistic(firstItem: 2, secondItem: 1)
    let crossesTeam = MockStructForStatistic(firstItem: 1, secondItem: 4)
    
    return [ballProfessionalTeam, goalAttempsTeam, shotsOnGoalTeam, shotsOfGoalTeam, freeKicksTeam, offSideTeam, yellowCardTeam, redCardTeam, crossesTeam]
}()


let mockTypeOfCell = ["Ball Professional","Goal Attempts","Shots on Goal","Shots of Goal","Free Kicks","Offsides","Yellow Cards","Red Cards","Crosses",]


