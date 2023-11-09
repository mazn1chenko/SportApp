//
//  ViewController.swift
//  SportApp
//
//  Created by m223 on 08.11.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let headerOfTableLabel = UILabel()
    
    private let mainColectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.cellId)
        return collectionView
        
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Resourses.Colors.backgroundColor
        
        navigationController?.pushViewController(PreloaderViewController(), animated: false)
        
        setupViews()
        setupLayouts()
        
    }
    
    //MARK: - setupViews
    
    private func setupViews() {
        
        headerOfTableLabel.translatesAutoresizingMaskIntoConstraints = false
        headerOfTableLabel.text = "ALL EVENTS"
        headerOfTableLabel.font = Resourses.Fonts.pilatExtendedBlack
        headerOfTableLabel.textColor = .white
        headerOfTableLabel.textAlignment = .left
        
        mainColectionView.translatesAutoresizingMaskIntoConstraints = false
        mainColectionView.backgroundColor = Resourses.Colors.backgroundColor
        mainColectionView.delegate = self
        mainColectionView.dataSource = self
        
    }
    
    //MARK: - setupLayouts
    
    private func setupLayouts() {
        view.addSubview(headerOfTableLabel)
        view.addSubview(mainColectionView)
        
        let constantLineIndents: CGFloat = 15
        
        NSLayoutConstraint.activate([
        
            headerOfTableLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            headerOfTableLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: constantLineIndents),
            headerOfTableLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -constantLineIndents),
            
            mainColectionView.topAnchor.constraint(equalTo: headerOfTableLabel.bottomAnchor, constant: 2*constantLineIndents),
            mainColectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: constantLineIndents),
            mainColectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -constantLineIndents),
            mainColectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        
        ])
        
    }
    


}

//MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: view.frame.width - 2*15, height: view.frame.height / 6.2)
    }
}

//MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        navigationController?.pushViewController(EventDetailViewController(), animated: true)
    }
    
}

//MARK: - UICollectionViewDelegate

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.cellId, for: indexPath) as? MainCollectionViewCell
        
        cell?.layer.cornerRadius = 15
        
        
        return cell!
    }
    
    
    
}

