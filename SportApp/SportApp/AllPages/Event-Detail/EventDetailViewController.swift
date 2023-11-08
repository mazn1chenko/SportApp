//
//  EventDetailViewController.swift
//  SportApp
//
//  Created by m223 on 08.11.2023.
//

import UIKit

final class EventDetailViewController: UIViewController {
    
    let customNavigationTitleView = UIView()
    
    let topView = UIView()
    let firstDecorationBall = UIImageView()
    let secondDecorationBall = UIImageView()
    
    let customBackButtom = UIButton()
    
    let customTitle = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Resourses.Colors.backgroundColor
        navigationItem.hidesBackButton = true
        
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        
        customNavigationTitleView.translatesAutoresizingMaskIntoConstraints = false
        customNavigationTitleView.backgroundColor = Resourses.Colors.backgroundColorOfCollectionViewCell
        navigationItem.titleView = customNavigationTitleView
        
        customTitle.translatesAutoresizingMaskIntoConstraints = false
        customTitle.text = "Detail Event"
        customTitle.textAlignment = .center
        customTitle.textColor = .white
        
        customBackButtom.translatesAutoresizingMaskIntoConstraints = false
        customBackButtom.setImage(UIImage(named: "backButton"), for: .normal)
        customBackButtom.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        customBackButtom.tintColor = Resourses.Colors.backButtonColor

        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = Resourses.Colors.backgroundColorOfCollectionViewCell
        
        firstDecorationBall.image = UIImage(named: "ball")
        firstDecorationBall.translatesAutoresizingMaskIntoConstraints = false
        
        secondDecorationBall.image = UIImage(named: "ball")
        secondDecorationBall.translatesAutoresizingMaskIntoConstraints = false

        
    }
    
    private func setupLayouts() {
        
        view.addSubview(topView)
        topView.addSubview(firstDecorationBall)
        topView.addSubview(secondDecorationBall)
        view.addSubview(customNavigationTitleView)
        customNavigationTitleView.addSubview(customTitle)
        customNavigationTitleView.addSubview(customBackButtom)
        
        let constantLineIndents: CGFloat = 15
        
        NSLayoutConstraint.activate([
            
            topView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.widthAnchor.constraint(equalToConstant: view.frame.width),
            topView.heightAnchor.constraint(equalToConstant: view.frame.height / 4 * 1.25),
            
            firstDecorationBall.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: -70),
            firstDecorationBall.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: 40),
            
            secondDecorationBall.topAnchor.constraint(equalTo: topView.topAnchor),
            secondDecorationBall.trailingAnchor.constraint(equalTo: topView.trailingAnchor),

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


        ])
        
        
    }
        
    @objc func tapBackButton() {
        
        navigationController?.popToRootViewController(animated: true)
        
    }
    
}
