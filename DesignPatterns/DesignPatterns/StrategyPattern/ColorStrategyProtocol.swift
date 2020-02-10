//
//  ColorStrategyProtocol.swift
//  DesignPatterns
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-10.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import Foundation
import UIKit

protocol ColorStrategyProtocol {
    var viewController: BaseViewController { get set }
    func setBGColor()
}
