//
//  ViewController.swift
//  Shualeduri
//
//  Created by Levan Charuashvili on 23.10.21.
//

import UIKit
import SideMenu

func checkMainmenu(){
    if UserDefaults.standard.bool(forKey: "Veganuri") == false && UserDefaults.standard.bool(forKey: "Samarxvo")  == false && UserDefaults.standard.bool(forKey: "Vegetarianuli")  == false {
        yvelaSachmeli += unfilteredSachmelebi
    } else {
        yvelaSachmeli = Array(Set(yvelaSachmeli).subtracting(unfilteredSachmelebi))
    }
}
var mtavariMenu:[SachmelebiData] = yvelaSachmeli

class ViewController: UIViewController {
    var url:String = ""
    @IBOutlet weak var labelVchamo: UILabel!
    @IBOutlet weak var labelDghes: UILabel!
    @IBOutlet weak var labelRa: UILabel!
    @IBOutlet weak var clickButton: UIButton!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var sachmeliNameLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        UIStyling()
        if UserDefaults.standard.bool(forKey: "Samarxvo") {
            yvelaSachmeli += samarxvoSachmelebi
            yvelaSachmeli = Array(Set(yvelaSachmeli).subtracting(unfilteredSachmelebi))
        }
         else {
             yvelaSachmeli = Array(Set(yvelaSachmeli).subtracting(samarxvoSachmelebi))
        }
        if UserDefaults.standard.bool(forKey: "Vegetarianuli") {
            yvelaSachmeli += vegetarianuliSachmelebi
            yvelaSachmeli = Array(Set(yvelaSachmeli).subtracting(unfilteredSachmelebi))
        } else {
            yvelaSachmeli = Array(Set(yvelaSachmeli).subtracting(vegetarianuliSachmelebi))
        }
        if UserDefaults.standard.bool(forKey: "Veganuri") {
            yvelaSachmeli += veganuriMenu
            yvelaSachmeli = Array(Set(yvelaSachmeli).subtracting(unfilteredSachmelebi))
        } else {
            yvelaSachmeli = Array(Set(yvelaSachmeli).subtracting(veganuriMenu))
            
        }
        checkMainmenu()
    }
    func UIStyling(){
        labelVchamo.coolLabelStyle(fontSize: 60)
        labelDghes.coolLabelStyle(fontSize: 60)
        labelRa.coolLabelStyle(fontSize: 60)
        sachmeliNameLabel.coolLabelStyle(fontSize: 60)
        clickButton.coolButtonStyle(fontSize: 30)
    }
    @IBAction func onClick(_ sender: Any) {
        clickButton.setTitle("არ მომწონს", for: .normal)
        clickButton.titleLabel?.font = UIFont(name: "ArchyEDT-Bold", size: 60)
        guard let randomIndexFromArray = yvelaSachmeli.indices.randomElement() else {
            sachmeliNameLabel.text = "ფაფუ"
            return
        }
        let randSachemli = yvelaSachmeli[randomIndexFromArray]
        sachmeliNameLabel.text = randSachemli.name
        url = randSachemli.link
        yvelaSachmeli.remove(at: randomIndexFromArray)
        
        UIView.animate(withDuration: 0.03,
            animations: {
            self.clickButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.03) {
                    self.clickButton.transform = CGAffineTransform.identity
                }
    })
    }
    @IBAction func googleButton(){
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
    
}

