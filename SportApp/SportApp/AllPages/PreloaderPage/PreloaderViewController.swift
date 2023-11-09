//
//  PreloaderViewController.swift
//  SportApp
//
//  Created by m223 on 08.11.2023.
//

import UIKit

final class PreloaderViewController: UIViewController {
    
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Resourses.Colors.backgroundColor
        
        setupViews()
        setupLayouts()
    }
    
    //MARK: - setupViews
    
    private func setupViews() {
        
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        
    }
    
    //MARK: - setupLayouts

    private func setupLayouts() {
        view.addSubview(activityIndicator)
        
    }
    
    private func startLoading() {
        activityIndicator.startAnimating()

        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(stopLoading), userInfo: nil, repeats: false)

    }
    
    @objc func stopLoading() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        startLoading()
    }
    
}
