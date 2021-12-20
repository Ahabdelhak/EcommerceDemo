//
//  ProductsTableViewCell.swift
//  EcommerceDemo
//
//  Created by Ahmed Amer on 25/11/2021.
//

import UIKit

typealias SeeAllClosure = ((_ index:Int?) -> Void)

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionViewCell: UICollectionView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var index:Int?
    var onClickSeeAllClosure: SeeAllClosure?
    var products:Product? {
        didSet {
            categoryLabel.text = products?.categoryName
            collectionViewCell.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionViewCell.delegate = self
        collectionViewCell.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onClickSeeAll(_ sender: Any) {
        onClickSeeAllClosure?(index)
    }
}

extension ProductsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return products?.products?.count ?? 0
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell else {
             return UICollectionViewCell()
         }
         cell.productName.text = products?.products?[indexPath.row].name
         cell.img.image = UIImage(named: products?.products?[indexPath.row].imageName ?? "")
         return cell
     }
     
 }
