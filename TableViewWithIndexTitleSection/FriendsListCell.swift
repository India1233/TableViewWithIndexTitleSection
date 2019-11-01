//
//  FriendsListCell.swift
//  TableViewWithIndexTitleSection
//
//  Created by Suresh Shiga on 01/11/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

class FriendsListCell: UITableViewCell {

    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var checkBoxImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2
        self.profileImage.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
