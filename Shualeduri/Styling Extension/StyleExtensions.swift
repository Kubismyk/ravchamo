//
//  StyleExtensions.swift
//  Shualeduri
//
//  Created by Levan Charuashvili on 23.10.21.
//

import Foundation
import UIKit
import SideMenu

public extension UILabel {
    func coolLabelStyle(fontSize:Int){
        self.font = UIFont(name: "ArchyEDT-Bold", size: CGFloat(fontSize))
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
    }
}
public extension UIButton {
    func coolButtonStyle(fontSize:Int){
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 8.0
        self.titleLabel?.font = UIFont(name: "ArchyEDT-Bold", size: CGFloat(fontSize))
        }
    }
public extension UISwitch {

    func set(width: CGFloat, height: CGFloat) {

        let standardHeight: CGFloat = 31
        let standardWidth: CGFloat = 51

        let heightRatio = height / standardHeight
        let widthRatio = width / standardWidth

        transform = CGAffineTransform(scaleX: widthRatio, y: heightRatio)
    }
}



