//
//  ViewController.swift
//  EcommerceDemo
//
//  Created by Ahmed Amer on 25/11/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var productData:ProductModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJson()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func loadJson() {
           if let path = Bundle.main.path(forResource: "EcommerceJson", ofType: "json") {
               do {
                   let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                   let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                   let jsonData = try JSONSerialization.data(withJSONObject: jsonResult, options: .prettyPrinted)
                   let jsonDecoder = JSONDecoder()
                   jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                   productData = try jsonDecoder.decode(ProductModel.self, from: jsonData)
                   
                 } catch {
                      // handle error
                 }
           }
       }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productData?.response?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell") as? ProductsTableViewCell else {
            return UITableViewCell()
        }
        cell.products=productData?.response?[indexPath.row]
        cell.index = indexPath.row
        cell.onClickSeeAllClosure = { index in
            if let indexp = index{
                self.moveOnProductListing(index: indexp)
            }
        }
        
        cell.didSelectClosure = {tableIndex , colIndex in
            if let tableIndexP = tableIndex , let colIndexP = colIndex {
                self.moveOnProductDetails(tableIndex: tableIndexP, colIndex: colIndexP)
            }
            
        }
        
        return cell
    }
    
    
    func moveOnProductListing(index : Int){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProductListViewController") as? ProductListViewController else {
            return
        }
        vc.productList = productData?.response?[index]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveOnProductDetails(tableIndex: Int,colIndex : Int){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as? ProductDetailsViewController else {
            return
        }
        vc.productDetails=productData?.response?[tableIndex].products?[colIndex]
        navigationController?.pushViewController(vc, animated: true)
    }

}

