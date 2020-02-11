//
//  OrangeColorStrategy.swift
//  StrategyDesignPatterns
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-10.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import Foundation

struct OrangeColorStrategy: ColorStrategyProtocol {
    var viewController: BaseViewController

    func setBGColor() {
        viewController.view.backgroundColor = .orange
    }
}
