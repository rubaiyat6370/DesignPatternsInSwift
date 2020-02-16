//
//  ProfileTableViewCell.swift
//  RepositoryPattern
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-13.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import UIKit

class ProfileTableViewCell: CustomTableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!

    @IBOutlet weak var addressLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.radius = 0
    }

    func setupView(user: UserProfile) {
        self.NameLabel.text = user.name
        self.addressLabel.text = "\(user.address?.city ?? "") \(user.address?.country ?? "")"
        self.bioLabel.text = user.bio
        self.userImageView.image = UIImage(named: user.image!)
        self.userImageView.roundedImage()
    }
    
}

//@IBDesignable
class CustomTableViewCell: UITableViewCell {

    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable var radius: CGFloat = 0 {
        didSet {
            let anim = CABasicAnimation(keyPath: "shadowRadius")
            anim.fromValue = oldValue
            anim.toValue = radius
            anim.duration = 0.2
            layer.add(anim, forKey: anim.keyPath)
            self.layer.shadowRadius = self.radius
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0.2 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.gray {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var bgColor: UIColor = UIColor.white {
        didSet {
            contentView.backgroundColor = bgColor
        }
    }

    @IBInspectable var shadowOpacity: Float = 0.9 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupShadow()
    }

    fileprivate func setupShadow() {
        // add shadow on cell
        backgroundColor = .clear // very important
        layer.masksToBounds = true
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = radius
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = shadowColor.cgColor

        // add corner radius on `contentView`
        contentView.backgroundColor = bgColor
        contentView.layer.cornerRadius = radius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupShadow()
    }
}

extension UIImageView {
    func roundedImage() {
        self.layer.cornerRadius = (self.frame.size.width) / 2;
        //self.clipsToBounds = true
        self.layer.borderWidth = 3.0
        self.layer.borderColor = UIColor.black.cgColor
    }
}
