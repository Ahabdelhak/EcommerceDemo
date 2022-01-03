//
//  ProductDetailsViewController.swift
//  EcommerceDemo
//
//  Created by Ahmed Amer on 21/12/2021.
//

import UIKit

class ProductDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var productDetails:ProductDetails?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title=productDetails?.name
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailsTableViewCell") as? ProductDetailsTableViewCell else {
            return UITableViewCell()
        }
        cell.productName.text=productDetails?.name
        cell.productDesc.text=productDetails?.description
        cell.productPrice.text=productDetails?.price
        
        cell.productImage?.image=UIImage(named: productDetails?.imageName ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 350
    }

}
