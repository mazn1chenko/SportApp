//
//  extraColor.swift
//  SportApp
//
//  Created by m223 on 08.11.2023.
//

import UIKit

enum Resourses {
    
    enum Colors {
        
        static var backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)
        static var backgroundColorOfCollectionViewCell = UIColor(red: 41/255, green: 41/255, blue: 41/255, alpha: 1)
        static var backgroundColorOfTableView = UIColor(red: 41/255, green: 41/255, blue: 41/255, alpha: 1)
        static var backgroundColorOfCollectionAndTableEventDetailPage = UIColor(red: 41/255, green: 41/255, blue: 41/255, alpha: 1)
        static var backButtonColor = UIColor(red: 148/255, green: 148/255, blue: 148/255, alpha: 1)
        static var h2hAndStatisticActivButtonColor = UIColor(red: 255/255, green: 75/255, blue: 0/255, alpha: 1)
        static var colorOfCollectionViewCellEventDetailPage = UIColor(red: 50/255, green: 49/255, blue: 49/255, alpha: 1)
        
        static var dateColorEventCell = UIColor(red: 152/255, green: 152/255, blue: 152/255, alpha: 1)
        static var backgroundColorOfScoreLabelInCellEventdetailPage = UIColor(red: 255/255, green: 75/255, blue: 0/255, alpha: 0.2)
        static var totalScoreButtonTitleColor = UIColor(red: 255/255, green: 75/255, blue: 0/255, alpha: 1)
        
        static var dateOfMatch = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        
        static var borderOfCellOnEventDetail = UIColor(red: 79/255, green: 79/255, blue: 79/255, alpha: 1)
    }
    
    enum Fonts {
        
        static var pilatExtendedBlack = UIFont(name: "PilatExtended-Heavy", size: 16)
        
        static var SFProDisplaySemiboldItalicForNameOfTeamOnMainPage = UIFont(name: "SFProDisplay-SemiboldItalic", size: 14)
        static var SFProDisplaySemiboldItalicForfootballDevisionOnMainPage = UIFont(name: "SFProDisplay-SemiboldItalic", size: 10)
    }
    
    enum Image {
        
        static var imageOfTeam = UIImage(named: "Ellipse 1")
        
        static var ball1 = UIImage(named: "ball1")
        static var ball2 = UIImage(named: "ball2")
        
    }
    
}
