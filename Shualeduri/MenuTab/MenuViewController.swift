//
//  MenuViewController.swift
//  Shualeduri
//
//  Created by Levan Charuashvili on 26.10.21.
//

import UIKit

var samarxvoSachmelebi:[SachmelebiData] = samarxvoMenu
var vegetarianuliSachmelebi:[SachmelebiData] = vegetarianuliMenu
var veganuriSachmelebi:[SachmelebiData] = veganuriMenu
var unfilteredSachmelebi:[SachmelebiData] = mainMenu

class MenuViewController: UIViewController {
    
    
    let defaults = UserDefaults.standard
    
    
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var samarxvoLabel: UILabel!
    @IBOutlet weak var vegetarianuliLabel: UILabel!
    @IBOutlet weak var veganuriLabel: UILabel!
    
    @IBOutlet weak var yvelaSachmeliLabel: UILabel!
    
    @IBOutlet weak var samarxvoSwitch: UISwitch!
    @IBOutlet weak var vegetarianuliSwitch: UISwitch!
    @IBOutlet weak var veganuriSwitch: UISwitch!
    @IBOutlet weak var yvelaSachmeliSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
    }

    func setupStyle(){
        menuLabel.coolLabelStyle(fontSize: 35)
        samarxvoLabel.coolLabelStyle(fontSize: 25)
        veganuriLabel.coolLabelStyle(fontSize: 25)
        vegetarianuliLabel.coolLabelStyle(fontSize: 25)
        samarxvoSwitch.set(width: 45, height: 25)
        vegetarianuliSwitch.set(width: 45, height: 25)
        veganuriSwitch.set(width: 45, height: 25)
    }
    @IBAction func samarxvoDidChange(_ samarxvoSender: UISwitch) {
        UserDefaults.standard.set(samarxvoSender.isOn, forKey: "Samarxvo")
        if samarxvoSender.isOn {
            yvelaSachmeli += samarxvoSachmelebi
            yvelaSachmeli = Array(Set(yvelaSachmeli).subtracting(unfilteredSachmelebi))
        } else {
            yvelaSachmeli = Array(Set(yvelaSachmeli).subtracting(samarxvoSachmelebi))
        }
        checkMainmenu()

    }
    @IBAction func vegetarianuliDidChange(_ vegetarianuliSender: UISwitch) {
        UserDefaults.standard.set(vegetarianuliSender.isOn, forKey:"Vegetarianuli")
        if vegetarianuliSender.isOn {
            yvelaSachmeli += vegetarianuliSachmelebi
            yvelaSachmeli = Array(Set(yvelaSachmeli).subtracting(unfilteredSachmelebi))
        } else {
            yvelaSachmeli = Array(Set(yvelaSachmeli).subtracting(vegetarianuliSachmelebi))
        }
        checkMainmenu()

    }
    @IBAction func veganuriDidChange(_ veganuriSender: UISwitch) {
        UserDefaults.standard.set(veganuriSender.isOn, forKey:"Veganuri")
        if veganuriSender.isOn {
            yvelaSachmeli += veganuriMenu
            yvelaSachmeli = Array(Set(yvelaSachmeli).subtracting(unfilteredSachmelebi))
        } else {
            yvelaSachmeli = Array(Set(yvelaSachmeli).subtracting(veganuriMenu))
        }
        checkMainmenu()

    }
    override func viewWillAppear(_ animated: Bool) {
        if defaults.object(forKey: "Vegetarianuli") != nil {
            vegetarianuliSwitch.isOn = defaults.bool(forKey: "Vegetarianuli")
        }
        if defaults.object(forKey: "Samarxvo") != nil {
            samarxvoSwitch.isOn = defaults.bool(forKey: "Samarxvo")
        }
        if defaults.object(forKey: "Veganuri") != nil {
            veganuriSwitch.isOn = defaults.bool(forKey: "Veganuri")
        }
    }
}

