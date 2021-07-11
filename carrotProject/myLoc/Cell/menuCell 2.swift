//
//  menuCell.swift
//  carrotProject
//
//  Created by 이진하 on 2021/07/10.
//

import UIKit

class menuCell: UICollectionViewCell {

    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var menuName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        innerView.backgroundColor = .white
    }

}
