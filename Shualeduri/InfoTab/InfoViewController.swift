//
//  InfoViewController.swift
//  Shualeduri
//
//  Created by Levan Charuashvili on 23.10.21.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.coolLabelStyle(fontSize: 25)
    }
    

}
