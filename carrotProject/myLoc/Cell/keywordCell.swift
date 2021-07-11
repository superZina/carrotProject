//
//  keywordCell.swift
//  carrotProject
//
//  Created by 이진하 on 2021/07/10.
//

import UIKit

class keywordCell: UICollectionViewCell {

    @IBOutlet weak var keyword: UILabel!
    @IBOutlet weak var innerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        innerView.layer.cornerRadius = 18
        innerView.layer.borderWidth = 1
        innerView.layer.borderColor = UIColor.textFieldBlue.cgColor
    }

}
