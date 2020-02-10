//
//  ViewController.swift
//  DesignPatterns
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-10.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import UIKit


class StrategyViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Stategy Pattern"
    }

    @IBAction func redButtonPressed(_ sender: Any) {
        RedColorStrategy(viewController: self).setBGColor()
    }
    @IBAction func blueButtonPressed(_ sender: Any) {
        BlueColorStategy(viewController: self).setBGColor()
    }
    
    @IBAction func orangeButtonPressed(_ sender: Any) {
        OrangeColorStrategy(viewController: self).setBGColor()
    }
}

