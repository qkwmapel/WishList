//
//  WishCell.swift
//  wishList
//
//  Created by 송정훈 on 4/16/24.
//

import UIKit

class WishCell: UITableViewCell {

    @IBOutlet var priceLbl: UILabel!
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var idLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
