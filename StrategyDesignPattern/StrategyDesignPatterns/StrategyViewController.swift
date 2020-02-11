//
//  ViewController.swift
//  StrategyDesignPatterns
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-10.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import UIKit


class StrategyViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Stategy Pattern Sample"
    }

    @IBAction func redButtonPressed(_ sender: Any) {
        ColorStrategy(strategy: RedColorStrategy(viewController: self)).changeBG()
    }
    @IBAction func blueButtonPressed(_ sender: Any) {
        ColorStrategy(strategy: BlueColorStategy(viewController: self)).changeBG()
    }

    @IBAction func orangeButtonPressed(_ sender: Any) {
        ColorStrategy(strategy: OrangeColorStrategy(viewController: self)).changeBG()
    }
}

