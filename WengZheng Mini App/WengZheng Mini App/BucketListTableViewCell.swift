//
//  BucketListTableViewCell.swift
//  WengZheng Mini App
//
//  Created by Zheng, Alicia Ren (arz7cn) on 10/1/18.
//  Copyright © 2018 Jeremy Weng and Alicia Zheng. All rights reserved.
//

import UIKit

internal class BucketListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func update(with bucketItem: BucketItem) {
        nameLabel.text = bucketItem.title
        dateLabel.text = bucketItem.date
    }

}
