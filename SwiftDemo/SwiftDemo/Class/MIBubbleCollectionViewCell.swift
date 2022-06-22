//
//  MIBubbleCollectionViewCell.swift
//  SwiftDemo
//
//  Created by mac-0007 on 05/12/17.
//  Copyright © 2017 Jignesh-0007. All rights reserved.
//

import UIKit

class MIBubbleCollectionViewCell: UICollectionViewCell {

    @IBOutlet var lblTitle:UILabel!
    @IBOutlet weak var itemImageView: RoundImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 1
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
    }
    
    func configure(with item: Item) {

        lblTitle.text = item.name
        lblTitle.textColor = item.isSelected ? .white : .black
        itemImageView.image = item.image
        layer.borderColor = item.color.cgColor
        backgroundColor = item.color.withAlphaComponent(item.isSelected ? 1: 0.2)
    }
}
