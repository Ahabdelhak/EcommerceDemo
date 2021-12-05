//
//  ProductsTableViewCell.swift
//  EcommerceDemo
//
//  Created by Ahmed Amer on 25/11/2021.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionViewCell: UICollectionView!
    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onClickSeeAll(_ sender: Any) {
    }
}
