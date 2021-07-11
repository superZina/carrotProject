//
//  recommendCell.swift
//  carrotProject
//
//  Created by 이진하 on 2021/07/11.
//

import UIKit

class recommendCell: UICollectionViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var photo1: UIImageView!
    @IBOutlet weak var photo2: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var reviewNum: UILabel!
    @IBOutlet weak var customNum: UILabel!
    @IBOutlet weak var textContainerView: UIView!
    @IBOutlet weak var reviewLabel: UILabel!
    
    // MARK: - Properties
    
    var recommend:Recommend? {
        didSet {
            configure()
        }
    }
    
    //MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.08
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowColor = UIColor.gray.cgColor
        clipsToBounds = false
        
        innerView.layer.cornerRadius = 14
        innerView.backgroundColor = .white
        photo1.roundCorners(cornerRadius: 14, maskedCorners: [.layerMinXMinYCorner])
        photo2.roundCorners(cornerRadius: 14, maskedCorners: [.layerMaxXMinYCorner])
        photo1.contentMode = .scaleAspectFill
        photo2.contentMode = .scaleAspectFill
        textContainerView.layer.cornerRadius = 14
        storeName.textColor = .black
        content.textColor = .black
        textContainerView.backgroundColor = .textFieldBlue
    }
    
    private func configure() {
        guard let recommend = recommend else { return }
        photo1.image = UIImage(named: recommend.photo1)
        photo2.image = UIImage(named: recommend.photo2)
        storeName.text = recommend.storeName
        content.text = recommend.content
        reviewNum.text = "후기 \(recommend.reviewNum)"
        customNum.text = "단골 \(recommend.customNum)"
        let review = NSMutableAttributedString(string: "\(recommend.customer)님 \(recommend.review)")
        review.setAttributes([ .font: UIFont.systemFont(ofSize: 13),
                              NSAttributedString.Key.foregroundColor: UIColor.black],
                             range: NSMakeRange(0, recommend.customer.count - 1))
        reviewLabel.attributedText = review
    }
    
}
