//
//  ProfileTableViewCell.swift
//  RepositoryPattern
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-13.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import UIKit

class ProfileTableViewCell: CustomTableViewCell {

    @IBOutlet weak var NameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

//@IBDesignable
class CustomTableViewCell: UITableViewCell {

    @IBInspectable var bgColor: UIColor = .red {
        didSet {
            layer.shadowColor = bgColor.cgColor
        }
    }
    @IBInspectable var radius: CGFloat = 4 {
        didSet {
            layer.shadowRadius = radius
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupShadow()
    }

    fileprivate func setupShadow() {
        // add shadow on cell
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.9
        layer.shadowRadius = radius
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = bgColor.cgColor

        // add corner radius on `contentView`
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.blue.cgColor
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupShadow()
    }
}
