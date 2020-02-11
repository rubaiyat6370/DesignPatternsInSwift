//
//  ColorStrategy.swift
//  StrategyDesignPatterns
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-10.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import Foundation

struct ColorStrategy {
    var strategy: ColorStrategyProtocol

    func changeBG() {
        strategy.setBGColor()
    }
}
