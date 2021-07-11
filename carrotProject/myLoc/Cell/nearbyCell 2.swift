//
//  nearbyCell.swift
//  carrotProject
//
//  Created by 이진하 on 2021/07/10.
//

import UIKit

class nearbyCell: UITableViewCell {

    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var townName: UILabel!
    @IBOutlet weak var couponLabel: UILabel!
    
    override func prepareForReuse() {
        couponLabel.isHidden = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .white        
        couponLabel.isHidden = true
        couponLabel.layer.cornerRadius = 8
        couponLabel.roundCorners(cornerRadius: 8, maskedCorners: [.layerMinXMinYCorner , .layerMaxXMaxYCorner])
        contentImage.layer.cornerRadius = 8
        profileImg.layer.cornerRadius = 10
                
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 30, right: 0))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
