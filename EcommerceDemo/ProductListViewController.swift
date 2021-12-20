//
//  ProductListViewController.swift
//  EcommerceDemo
//
//  Created by Ahmed Amer on 20/12/2021.
//

import UIKit

class ProductListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var productList:Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title=productList?.categoryName
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList?.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailsTableViewCell") as? ProductDetailsTableViewCell else {
            return UITableViewCell()
        }
        cell.productName.text=productList?.products?[indexPath.row].name
        cell.productDesc.text=productList?.products?[indexPath.row].description
        cell.productPrice.text=productList?.products?[indexPath.row].price
        
        cell.imageView?.image=UIImage(named: productList?.products?[indexPath.row].imageName ?? "")
        return cell
    }

}
