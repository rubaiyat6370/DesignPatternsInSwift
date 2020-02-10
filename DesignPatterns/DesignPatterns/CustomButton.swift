//
//  CustomButton.swift
//  DesignPatterns
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-10.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import Foundation
import UIKit

//@IBDesignable
class CustomButton: UIButton {

    @IBInspectable var borderColor: UIColor = .white
    @IBInspectable var borderWidth: CGFloat = 2
    @IBInspectable var cornerRadius: CGFloat = 50
    @IBInspectable var fillColor: UIColor = .red

    fileprivate func setup(_ rect: CGRect) {
        let path  = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        fillColor.setFill()
        path.fill()
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let shadowLayer = CAShapeLayer()
        shadowLayer.fillColor = fillColor.cgColor
        shadowLayer.path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath

        shadowLayer.shadowColor = borderColor.cgColor
        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        shadowLayer.shadowRadius = cornerRadius
        shadowLayer.shadowOpacity = 0.9
        self.layer.shadowPath = shadowLayer.path
        layer.insertSublayer(shadowLayer, at: 0)
    }

    override func draw(_ rect: CGRect) {
        setup(rect)
    }

}
