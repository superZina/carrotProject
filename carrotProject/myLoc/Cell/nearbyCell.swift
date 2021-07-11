//
//  nearbyCell.swift
//  carrotProject
//
//  Created by 이진하 on 2021/07/10.
//

import UIKit

class nearbyCell: UITableViewCell {
    
    // MARK: - IBOutlets

    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var townName: UILabel!
    @IBOutlet weak var couponLabel: UILabel!
    
    // MARK: - Properties
    
    var news: News? {
        didSet {
            configure()
        }
    }
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .white
        clipsToBounds = true
        couponLabel.isHidden = true
        couponLabel.layer.cornerRadius = 8
        couponLabel.roundCorners(cornerRadius: 8, maskedCorners: [.layerMinXMinYCorner , .layerMaxXMaxYCorner])
        contentImage.layer.cornerRadius = 8
        profileImg.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        couponLabel.isHidden = true
    }
    
    private func configure() {
        guard let news = news else { return }
        contentImage.image = UIImage(named: news.contentImg)
        content.text = news.content
        title.text = news.title
        profileImg.image = UIImage(named: news.profileImg)
        townName.text = news.townName
        nickName.text = news.nickName
        if news.couponExist {
            couponLabel.isHidden = false
        }
    }
}
